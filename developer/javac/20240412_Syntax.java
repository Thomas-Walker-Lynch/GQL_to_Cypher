import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.lang.reflect.Method;

public class Syntax_20240412 {

  // Versioned Lexer and Parser
  static final Class<?> GQL_Lexer = GQL_20240412Lexer.class;
  static final Class<?> GQL_Parser = GQL_20240412Parser.class;

  public static void main(String[] args) throws IOException {
    if (args.length != 1) {
      System.err.println("Usage: java Syntax20240412 <input-file>");
      System.exit(1);
    }

    String inputFile = args[0];
    String input = new String(Files.readAllBytes(Paths.get(inputFile)));

    try {
      Lexer lexer = (Lexer) GQL_Lexer.getConstructor(CharStream.class).newInstance(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      Parser parser = (Parser) GQL_Parser.getConstructor(TokenStream.class).newInstance(tokens);
      Method startRule = parser.getClass().getMethod("program"); // Assuming 'program' is the start rule
      ParseSyntax tree = (ParseSyntax) startRule.invoke(parser);

      PrintVisitor visitor = new PrintVisitor(parser.getRuleNames());
      String syntaxSyntax = visitor.visit(tree);
      System.out.println(syntaxSyntax);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

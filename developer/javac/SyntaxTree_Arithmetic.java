import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.lang.reflect.Method;

public class SyntaxTree_Arithmetic {

  // Versioned Lexer and Parser
  static final Class<?> GQL_Lexer = ArithmeticLexer.class;
  static final Class<?> GQL_Parser = ArithmeticParser.class;

  public static void main(String[] args) throws IOException {
    if (args.length != 1) {
      System.err.println("Usage: java SyntaxTree <input-file>");
      System.exit(1);
    }

    String inputFile = args[0];
    String input = new String(Files.readAllBytes(Paths.get(inputFile)));

    try {
      Lexer lexer = (Lexer) GQL_Lexer.getConstructor(CharStream.class).newInstance(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      Parser parser = (Parser) GQL_Parser.getConstructor(TokenStream.class).newInstance(tokens);
      Method startRule = parser.getClass().getMethod("program"); // Assuming 'program' is the start rule
      ParseTree tree = (ParseTree) startRule.invoke(parser);

      PrintVisitor visitor = new PrintVisitor(parser.getRuleNames());
      String syntaxTree = visitor.visit(tree);
      System.out.println(syntaxTree);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

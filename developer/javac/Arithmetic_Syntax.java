import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Arithmetic_Syntax {

  public static void main(String[] args) throws IOException {
    if (args.length != 1) {
      System.err.println("Usage: java Syntax <input-file>");
      System.exit(1);
    }

    String inputFile = args[0];
    String input = Files.readString(Paths.get(inputFile));

    try {
      // Direct instantiation without reflection
      ArithmeticLexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      ArithmeticParser parser = new ArithmeticParser(tokens);

      // Directly calling the start rule method
      ParseTree tree = parser.program(); // Assuming 'program' is the start rule

      Arithmetic_Syntax_PrintVisitor visitor = new Arithmetic_Syntax_PrintVisitor(parser.getRuleNames());
      String syntaxSyntax = visitor.visit(tree);
      System.out.println(syntaxSyntax);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

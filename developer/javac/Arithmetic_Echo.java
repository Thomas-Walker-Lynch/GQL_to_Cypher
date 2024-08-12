import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Arithmetic_Echo {

  public static void main(String[] args) throws IOException {
    if (args.length != 1) {
      System.err.println("Usage: java Arithmetic_Echo <input-file>");
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

      Arithmetic_Echo_PrintVisitor visitor = new Arithmetic_Echo_PrintVisitor(parser.getRuleNames());
      String output = visitor.visit(tree);
      System.out.println(output);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Arithmetic_Swap {
  private static final String USAGE_MESSAGE =
    "Usage: Arithmetic_Swap [-version] <source-file-path>";

  public static void main(String[] args) throws IOException {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }
    boolean error = false;
    boolean version = false;
    List<String> argList = new ArrayList<>();
    for (String arg : args) {
      if (arg.startsWith("-")) {
        switch (arg) {
        case "-version":
          version = true;
          break;
        default:
          System.err.println("Unrecognized option: " + arg);
          error = true;
        }
      } else {
        argList.add(arg);
      }
    }
    if (version) {
      System.out.println("version 0.1");
      System.exit(error ? 1 : 0);
    }
    if (argList.size() != 1) {
      System.err.println("Expected exactly one non-option argument.");
      error = true;
    }
    if (error) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String inputFile = argList.get(0);
    String input = Files.readString(Paths.get(inputFile));

    try {
      ArithmeticLexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      ArithmeticParser parser = new ArithmeticParser(tokens);
      
      ParseTree tree = parser.program();

      Arithmetic_SwapVisitor swapVisitor = new Arithmetic_SwapVisitor();
      ParseTree transformedTree = swapVisitor.visit(tree);

      Arithmetic_Echo_PrintVisitor printVisitor = new Arithmetic_Echo_PrintVisitor(parser.getRuleNames());
      String output = printVisitor.visit(transformedTree);

      System.out.println(output);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

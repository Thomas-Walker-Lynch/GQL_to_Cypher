/*
Takes an 'Ariethemetic' grammar source file.  Parses it. Outputs an annotated
version of the source file while labeling what parts of the grammar the syntax
objects belong to.  Note the -pp option.

*/
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Arithmetic_SyntaxAnnotate {
  // Constant for the usage message
  private static final String USAGE_MESSAGE = 
    "Usage: Arithmetic_SyntaxAnnotate [-version] [-pp] <source-file>";

  public static void main(String[] args) throws IOException {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }
    boolean error = false;
    boolean version = false;
    boolean pretty_print = false;
    List<String> argList = new ArrayList<>();
    for (int i = 0; i < args.length; i++) {
      String arg = args[i];
      if (arg.startsWith("-")) {
        switch (arg) {
        case "-version":
          version = true;
          break;
        case "-pp":
          pretty_print = true;
          break;
        default:
          System.err.println("Unrecognized option: " + arg);
          error = true;
        }
      } else {
        argList.add(arg);
      }
    }
    if(version){
      System.out.println("version 0.1");
      if(error){
        System.exit(1);
      }else{
        System.exit(0);
      }
    }
    if (argList.size() != 1) {
      System.err.println("Expected exactly one non-option argument.");
      error = true;
    }
    if(error){
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String input_file = argList.get(0);
    String input = Files.readString(Paths.get(input_file));

    try {
      ArithmeticLexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      ArithmeticParser parser = new ArithmeticParser(tokens);
      ParseTree tree = parser.program();

      Arithmetic_SyntaxAnnotate_PrintVisitor visitor = 
        new Arithmetic_SyntaxAnnotate_PrintVisitor(parser.getRuleNames(), pretty_print);
      String output = visitor.visit(tree);
      System.out.println(output);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

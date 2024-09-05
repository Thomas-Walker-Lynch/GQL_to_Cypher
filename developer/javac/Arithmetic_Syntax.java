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

public class Arithmetic_Syntax {

  public static void main(String[] arg_array) throws IOException {
    boolean pretty_print = false;
    List<String> file_arg_list = new ArrayList<>();
    boolean has_error = false;
    String usage = "Usage: Arithmetic_Syntax [-pp] <source-file>"

    // Parse the options and arguments
    for (String arg : arg_array) {
      if (arg.startsWith("-")) {
        if (arg.equals("-pp")) {
          pretty_print = true;
        } else {
          System.err.println("Unrecognized option: " + arg);
          has_error = true;
        }
      } else {
        file_arg_list.add(arg);
      }
    }

    // If there were any errors, print usage and exit
    if (has_error) {
      System.err.println(usage);
      System.exit(1);
    }

    // Ensure there is exactly one input file
    if (file_arg_list.size() != 1) {
      System.err.println("usage");
      System.exit(1);
    }

    String input_file = file_arg_list.get(0);
    String input = Files.readString(Paths.get(input_file));

    try {
      ArithmeticLexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      ArithmeticParser parser = new ArithmeticParser(tokens);
      ParseTree tree = parser.program();

      Arithmetic_Syntax_PrintVisitor visitor = new Arithmetic_Syntax_PrintVisitor(parser.getRuleNames(), pretty_print);
      String output = visitor.visit(tree);
      System.out.println(output);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

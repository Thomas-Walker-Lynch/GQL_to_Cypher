/*
Takes an 'GQL_20240412' grammar source file.  Parses it. Outputs an annotated
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

public class GQL_20240412_Syntax {

  public static void main(String[] arg_array) throws IOException {
    boolean pretty_print = false;
    List<String> file_arg_list = new ArrayList<>();
    boolean has_error = false;

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
      System.err.println("Usage: java GQL_20240412_Syntax [-pp] <input-file>");
      System.exit(1);
    }

    // Ensure there is exactly one input file
    if (file_arg_list.size() != 1) {
      System.err.println("Usage: java GQL_20240412_Syntax [-pp] <input-file>");
      System.exit(1);
    }

    String input_file = file_arg_list.get(0);
    String input = Files.readString(Paths.get(input_file));

    try {
      GQL_20240412Lexer lexer = new GQL_20240412Lexer(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      GQL_20240412Parser parser = new GQL_20240412Parser(tokens);
      ParseTree tree = parser.program();

      GQL_20240412_Syntax_PrintVisitor visitor = new GQL_20240412_Syntax_PrintVisitor(parser.getRuleNames(), pretty_print);
      String output = visitor.visit(tree);
      System.out.println(output);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

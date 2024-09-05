/*
Takes an 'ANTLRv4' grammar source file.  Parses it. Outputs an annotated
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

public class ANTLRv4_Syntax {

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
      System.err.println("Usage: java ANTLRv4_Syntax [-pp] <input-file>");
      System.exit(1);
    }

    // Ensure there is exactly one input file
    if (file_arg_list.size() != 1) {
      System.err.println("Usage: java ANTLRv4_Syntax [-pp] <input-file>");
      System.exit(1);
    }

    String input_file = file_arg_list.get(0);
    String input = Files.readString(Paths.get(input_file));

    try {
      ANTLRv4Lexer lexer = new ANTLRv4Lexer(CharStreams.fromString(input));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      ANTLRv4Parser parser = new ANTLRv4Parser(tokens);
      ParseTree tree = parser.grammarSpec();

      ANTLRv4_Syntax_PrintVisitor visitor = new ANTLRv4_Syntax_PrintVisitor(parser.getRuleNames(), pretty_print);
      String output = visitor.visit(tree);
      System.out.println(output);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

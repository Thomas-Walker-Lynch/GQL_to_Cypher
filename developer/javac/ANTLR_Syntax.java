/*
Accepts an ANTLR grammar file.

Diagrams the ANTLR grammar file according to the ANTLR grammar grammar.

*/
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class ANTLR_Syntax {

  public static void main(String[] args) throws Exception {
    try {

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
        System.err.println("Usage: java Arithmetic_Syntax [-pp] <input-file>");
        System.exit(1);
      }

      // Ensure there is exactly one input file
      if (file_arg_list.size() != 1) {
        System.err.println("Usage: java Arithmetic_Syntax [-pp] <input-file>");
        System.exit(1);
      }

      String input_file = file_arg_list.get(0);
      String input = Files.readString(Paths.get(input_file));
        
      // Create a lexer and parser for the ANTLR grammar
      ANTLRv4Lexer lexer = new ANTLRv4Lexer(input);
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      ANTLRv4Parser parser = new ANTLRv4Parser(tokens);
        
      // Parse the input file
      ParseTree tree = parser.grammarSpec(); // Start rule for the ANTLR grammar
        
      // Walk the tree and visit each node
      ANTLR_Syntax_PrintVisitor visitor = new ANTLR_Syntax_PrintVisitor(prettyPrint);
      String output = visitor.visit(tree);
      System.out.println(output);
    } catch (Exception e) {
      e.printStackTrace();
    }

}

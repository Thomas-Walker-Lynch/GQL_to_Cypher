/*
Takes an 'Ariethemetic' grammar source file.  Parses it. Runs through the parse tree
and recreates the source file.

*/
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Arithmetic_Echo {
  // Constant for the usage message
  private static final String USAGE_MESSAGE =
    "Usage: Arithmetic_Echo [-version] <source-file-path>";

  public static void main(String[] args) throws IOException {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }
    boolean error = false;
    boolean version = false;
    List<String> argList = new ArrayList<>();
    for (int i = 0; i < args.length; i++) {
      String arg = args[i];
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

    String inputFile = argList.get(0);
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

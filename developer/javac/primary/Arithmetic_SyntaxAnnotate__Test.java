
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

public class Arithmetic_SyntaxAnnotate__Test {

  public static boolean Arithmetic_SyntaxAnnotate_0() {
    return runTest(
      "Arithmetic_SyntaxAnnotate__Test_0.txt"
     ,"program(expression(INT(3) operator(+) INT(5)))"
     );
  }

  public static boolean Arithmetic_SyntaxAnnotate_1() {
    return runTest(
      "Arithmetic_SyntaxAnnotate__Test_1.txt"
      ,"program(expression(INT(3) operator(+) INT(5)))"
   );
  }

  public static boolean Arithmetic_SyntaxAnnotate_2() {
    return runTest(
      "Arithmetic_SyntaxAnnotate__Test_2.txt" 
      ,"program(expression(INT(2) operator(*) (expression(INT(3) operator(+) INT(4)))))"
      );
  }

  public static boolean Arithmetic_SyntaxAnnotate_3() {
    return runTest(
      "Arithmetic_SyntaxAnnotate__Test_3.txt" 
      ,"program(expression(INT(10) operator(/) INT(2)))"
      );
  }

  public static boolean Arithmetic_SyntaxAnnotate_4() {
    return runTest(
      "Arithmetic_SyntaxAnnotate__Test_4.txt" 
      ,"program(expression(INT(3) operator(+) expression(INT(5) operator(*) (expression(INT(10) operator(-) INT(4))))))"
      );
  }

  private static boolean runTest(String filename ,String expectedOutput) {
    try {
      String input = Files.readString(Paths.get(filename));
      String actualOutput = runSyntaxAnnotate(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  private static String runSyntaxAnnotate(String input) throws Exception {
    Lexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ArithmeticParser parser = new ArithmeticParser(tokens);
    ParseTree tree = parser.program(); // Directly calling the start rule method

    Arithmetic_SyntaxAnnotate_PrintVisitor visitor = new Arithmetic_SyntaxAnnotate_PrintVisitor(parser.getRuleNames() ,false);
    return visitor.visit(tree);
  }

  // Constant for the usage message
  private static final String USAGE_MESSAGE = 
    "Usage: Arithmetic_SyntaxAnnotate__Test [-version]";

  public static void main(String[] args) {
    // if (args.length == 0) {
    //   System.err.println(USAGE_MESSAGE);
    //   System.exit(1);
    // }
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
    if (argList.size() != 0) {
      System.err.println("This program takes no arguments.");
      error = true;
    }
    if(error){
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    // Use LinkedHashMap to maintain order of test results
    Map<String, Boolean> tests = new LinkedHashMap<>();
    tests.put("Arithmetic_SyntaxAnnotate_0", Arithmetic_SyntaxAnnotate_0());
    tests.put("Arithmetic_SyntaxAnnotate_1", Arithmetic_SyntaxAnnotate_1());
    tests.put("Arithmetic_SyntaxAnnotate_2", Arithmetic_SyntaxAnnotate_2());
    tests.put("Arithmetic_SyntaxAnnotate_3", Arithmetic_SyntaxAnnotate_3());
    tests.put("Arithmetic_SyntaxAnnotate_4", Arithmetic_SyntaxAnnotate_4());

    TestBench.runTests(tests);
  }

}


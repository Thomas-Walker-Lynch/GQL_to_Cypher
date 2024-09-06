import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

public class Arithmetic_Echo__Test {
  // Constant for the usage message
  private static final String USAGE_MESSAGE =
    "Usage: Arithmetic_Echo__Test [-version]";

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

    Map<String, Boolean> tests = new HashMap<>();
    tests.put("Arithmetic_Echo_0", Arithmetic_Echo_0());
    tests.put("Arithmetic_Echo_1", Arithmetic_Echo_1());
    tests.put("Arithmetic_Echo_2", Arithmetic_Echo_2());
    tests.put("Arithmetic_Echo_3", Arithmetic_Echo_3());
    tests.put("Arithmetic_Echo_4", Arithmetic_Echo_4());

    TestBench.runTests(tests);
  }

  public static boolean Arithmetic_Echo_0() {
    // Simple smoke test
    try {
      String input = "3 + 5";
      String expectedOutput = "(3 + 5)";
      String actualOutput = runSyntax(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean Arithmetic_Echo_1() {
    // Test with multiplication
    try {
      String input = "2 * 3";
      String expectedOutput = "(2 * 3)";
      String actualOutput = runSyntax(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean Arithmetic_Echo_2() {
    // Test with parentheses
    try {
      String input = "2 * (3 + 4)";
      String expectedOutput = "(2 * (3 + 4))";
      String actualOutput = runSyntax(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean Arithmetic_Echo_3() {
    // Test with division
    try {
      String input = "10 / 2";
      String expectedOutput = "(10 / 2)";
      String actualOutput = runSyntax(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean Arithmetic_Echo_4() {
    // Test with complex expression
    try {
      String input = "3 + 5 * (10 - 4)";
      String expectedOutput = "(3 + (5 * (10 - 4)))";
      String actualOutput = runSyntax(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  private static String runSyntax(String input) throws Exception {
    Lexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ArithmeticParser parser = new ArithmeticParser(tokens);
    Method startRule = parser.getClass().getMethod("program");
    ParseTree tree = (ParseTree) startRule.invoke(parser);

    Arithmetic_Echo_PrintVisitor visitor = new Arithmetic_Echo_PrintVisitor(parser.getRuleNames());
    return visitor.visit(tree);
  }
}

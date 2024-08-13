import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class Arithmetic_Echo__Test {

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
      // Uncomment the print statement for debugging
      // System.out.println("Arithmetic_Echo_4 - Expected: " + expectedOutput + ", Actual: " + actualOutput);
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

  public static void main(String[] args) {
    Map<String, Boolean> tests = new HashMap<>();
    tests.put("Arithmetic_Echo_0", Arithmetic_Echo_0());
    tests.put("Arithmetic_Echo_1", Arithmetic_Echo_1());
    tests.put("Arithmetic_Echo_2", Arithmetic_Echo_2());
    tests.put("Arithmetic_Echo_3", Arithmetic_Echo_3());
    tests.put("Arithmetic_Echo_4", Arithmetic_Echo_4());

    TestBench.runTests(tests);
  }
}

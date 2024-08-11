import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class Test__SyntaxTree_Arithmetic {

  public static boolean PrintVisitor_0() {
    // Simple smoke test
    try {
      String input = "3 + 5";
      String expectedOutput = "(3 + 5)";
      String actualOutput = runSyntaxTree(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean PrintVisitor_1() {
    // Test with multiplication
    try {
      String input = "2 * 3";
      String expectedOutput = "(2 * 3)";
      String actualOutput = runSyntaxTree(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean PrintVisitor_2() {
    // Test with parentheses
    try {
      String input = "2 * (3 + 4)";
      String expectedOutput = "(2 * (3 + 4))";
      String actualOutput = runSyntaxTree(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean PrintVisitor_3() {
    // Test with division
    try {
      String input = "10 / 2";
      String expectedOutput = "(10 / 2)";
      String actualOutput = runSyntaxTree(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }

  public static boolean PrintVisitor_4() {
    // Test with complex expression
    try {
      String input = "3 + 5 * (10 - 4)";
      String expectedOutput = "(3 + (5 * (10 - 4)))";
      String actualOutput = runSyntaxTree(input);
      // Uncomment the print statement for debugging
      // System.out.println("PrintVisitor_4 - Expected: " + expectedOutput + ", Actual: " + actualOutput);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      return false;
    }
  }



  private static String runSyntaxTree(String input) throws Exception {
    Lexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    Parser parser = new ArithmeticParser(tokens);
    Method startRule = parser.getClass().getMethod("program");
    ParseTree tree = (ParseTree) startRule.invoke(parser);

    PrintVisitor visitor = new PrintVisitor(parser.getRuleNames());
    return visitor.visit(tree);
  }

  public static void main(String[] args) {
    Map<String, Boolean> tests = new HashMap<>();
    tests.put("PrintVisitor_0", PrintVisitor_0());
    tests.put("PrintVisitor_1", PrintVisitor_1());
    tests.put("PrintVisitor_2", PrintVisitor_2());
    tests.put("PrintVisitor_3", PrintVisitor_3());
    tests.put("PrintVisitor_4", PrintVisitor_4());

    TestBench.runTests(tests);
  }
}

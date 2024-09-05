import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.Map;

public class Arithmetic_Syntax__Test {

  public static boolean Arithmetic_Syntax_0() {
    return runTest(
      "Arithmetic_Syntax__Test_0.txt"
     ,"program(expression(INT(3) operator(+) INT(5)))"
     );
  }

  public static boolean Arithmetic_Syntax_1() {
    return runTest(
      "Arithmetic_Syntax__Test_1.txt"
      ,"program(expression(INT(3) operator(+) INT(5)))"
   );
  }

  public static boolean Arithmetic_Syntax_2() {
    return runTest(
      "Arithmetic_Syntax__Test_2.txt" 
      ,"program(expression(INT(2) operator(*) (expression(INT(3) operator(+) INT(4)))))"
      );
  }

  public static boolean Arithmetic_Syntax_3() {
    return runTest(
      "Arithmetic_Syntax__Test_3.txt" 
      ,"program(expression(INT(10) operator(/) INT(2)))"
      );
  }

  public static boolean Arithmetic_Syntax_4() {
    return runTest(
      "Arithmetic_Syntax__Test_4.txt" 
      ,"program(expression(INT(3) operator(+) expression(INT(5) operator(*) (expression(INT(10) operator(-) INT(4))))))"
      );
  }

  private static boolean runTest(String filename ,String expectedOutput) {
    try {
      String input = Files.readString(Paths.get(filename));
      String actualOutput = runSyntax(input);
      return expectedOutput.equals(actualOutput);
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  private static String runSyntax(String input) throws Exception {
    Lexer lexer = new ArithmeticLexer(CharStreams.fromString(input));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ArithmeticParser parser = new ArithmeticParser(tokens);
    ParseTree tree = parser.program(); // Directly calling the start rule method

    Arithmetic_Syntax_PrintVisitor visitor = new Arithmetic_Syntax_PrintVisitor(parser.getRuleNames() ,false);
    return visitor.visit(tree);
  }

  public static void main(String[] args) {
    // Use LinkedHashMap to maintain order of test results
    Map<String ,Boolean> tests = new LinkedHashMap<>();
    tests.put("Arithmetic_Syntax_0" ,Arithmetic_Syntax_0());
    tests.put("Arithmetic_Syntax_1" ,Arithmetic_Syntax_1());
    tests.put("Arithmetic_Syntax_2" ,Arithmetic_Syntax_2());
    tests.put("Arithmetic_Syntax_3" ,Arithmetic_Syntax_3());
    tests.put("Arithmetic_Syntax_4" ,Arithmetic_Syntax_4());

    TestBench.runTests(tests);
  }
}

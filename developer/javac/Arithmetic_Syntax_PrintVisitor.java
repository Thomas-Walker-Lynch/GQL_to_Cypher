import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

public class Arithmetic_Syntax_PrintVisitor extends ArithmeticBaseVisitor<String> {
  private final String[] ruleNames;

  public Arithmetic_Syntax_PrintVisitor(String[] ruleNames) {
    this.ruleNames = ruleNames;
  }

  @Override
  public String visitProgram(ArithmeticParser.ProgramContext ctx) {
    return "program(" + visit(ctx.expression()) + ")";
  }

  @Override
  public String visitExpression(ArithmeticParser.ExpressionContext ctx) {
    if (ctx.INT() != null) {
      return "INT(" + ctx.INT().getText() + ")";
    } else if (ctx.getChildCount() == 3 && ctx.getChild(0).getText().equals("(")) {
      // Handle parentheses in the context of the grammar structure
      return "expression(" + visit(ctx.expression(0)) + ")";
    } else {
      String left = visit(ctx.expression(0));
      String right = visit(ctx.expression(1));
      String operator = "operator(" + ctx.getChild(1).getText() + ")";
      return "expression(" + left + " " + operator + " " + right + ")";
    }
  }
}

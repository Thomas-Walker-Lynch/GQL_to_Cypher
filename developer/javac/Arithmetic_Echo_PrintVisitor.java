import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

public class Arithmetic_Echo_PrintVisitor extends ArithmeticBaseVisitor<String> {
  private final String[] ruleNames;

  public Arithmetic_Echo_PrintVisitor(String[] ruleNames) {
    this.ruleNames = ruleNames;
  }

  @Override
  public String visitProgram(ArithmeticParser.ProgramContext ctx) {
    return visit(ctx.expression());
  }

  @Override
  public String visitExpression(ArithmeticParser.ExpressionContext ctx) {
    if (ctx.INT() != null) {
      return ctx.INT().getText();
    } else if (ctx.getChildCount() == 3 && ctx.getChild(0).getText().equals("(")) {
      // Handle parentheses
      return visit(ctx.expression(0));  // Remove the extra parentheses
    } else {
      String left = visit(ctx.expression(0));
      String right = visit(ctx.expression(1));
      String operator = ctx.getChild(1).getText();
      return "(" + left + " " + operator + " " + right + ")";
    }
  }

}


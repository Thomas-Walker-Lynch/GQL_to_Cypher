import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

public class Arithmetic_SyntaxAnnotate_PrintVisitor extends ArithmeticBaseVisitor<String>{
  private final String[] rule_names;
  private final boolean pretty_print;

  public Arithmetic_SyntaxAnnotate_PrintVisitor(String[] rule_names, boolean pretty_print){
    this.rule_names = rule_names;
    this.pretty_print = pretty_print;
  }

  private String indent(int level){
    return "  ".repeat(level);
  }

  @Override
  public String visitProgram(ArithmeticParser.ProgramContext ctx){
    if(pretty_print){
      StringBuilder result = new StringBuilder();
      result.append("program\n").append(visitExpression(ctx.expression(), 1));
      return result.toString();
    }else{
      return "program(" + visit(ctx.expression()) + ")";
    }
  }

  @Override
  public String visitExpression(ArithmeticParser.ExpressionContext ctx){
    return visitExpression(ctx, 0);
  }

  private String visitExpression(ArithmeticParser.ExpressionContext ctx, int indent_level){
    StringBuilder result = new StringBuilder();
    if(pretty_print){
      result.append(indent(indent_level)).append("expression(\n");
      if( ctx.INT() != null ){
        result.append(indent(indent_level + 1)).append("INT(").append(ctx.INT().getText()).append(")\n");
      }else if( ctx.getChildCount() == 3 && ctx.getChild(0).getText().equals("(") ){
        result.append(indent(indent_level + 1)).append("(\n");
        result.append(visitExpression(ctx.expression(0), indent_level + 2));
        result.append(indent(indent_level + 1)).append(")\n");
      }else{
        result.append(visitExpression(ctx.expression(0), indent_level + 1));
        result.append(indent(indent_level + 1)).append("operator(").append(ctx.getChild(1).getText()).append(")\n");
        result.append(visitExpression(ctx.expression(1), indent_level + 1));
      }
      result.append(indent(indent_level)).append(")\n");
    }else{
      if( ctx.INT() != null ){
        result.append("INT(").append(ctx.INT().getText()).append(")");
      }else if( ctx.getChildCount() == 3 && ctx.getChild(0).getText().equals("(") ){
        result.append("(").append(visit(ctx.expression(0))).append(")");
      }else{
        String left = visit(ctx.expression(0));
        String right = visit(ctx.expression(1));
        String operator = "operator(" + ctx.getChild(1).getText() + ")";
        result.append("expression(").append(left).append(" ").append(operator).append(" ").append(right).append(")");
      }
    }
    return result.toString();
  }
}

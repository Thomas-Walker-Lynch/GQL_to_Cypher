import org.antlr.v4.runtime.tree.AbstractParseSyntaxVisitor;

public class PrintVisitor extends AbstractParseSyntaxVisitor<String> implements ArithmeticVisitor<String> {
    private final String[] ruleNames;

    public PrintVisitor(String[] ruleNames) {
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
        } else {
            String left = visit(ctx.expression(0));
            String right = visit(ctx.expression(1));
            String operator = ctx.getChild(1).getText();
            return "(" + left + " " + operator + " " + right + ")";
        }
    }
}

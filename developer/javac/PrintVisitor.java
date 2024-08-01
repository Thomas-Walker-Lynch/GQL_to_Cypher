import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.RuleContext;

public class PrintVisitor extends AbstractParseTreeVisitor<String> implements GQL_20240412Visitor<String> {
  private final String[] ruleNames;

  public PrintVisitor(String[] ruleNames) {
    this.ruleNames = ruleNames;
  }

  @Override
  public String visit(ParseTree tree) {
    if (tree instanceof TerminalNode) {
      return tree.getText();
    }

    StringBuilder sb = new StringBuilder();
    String ruleName = ruleNames[((RuleContext) tree).getRuleIndex()];
    sb.append(ruleName).append("(");

    for (int i = 0; i < tree.getChildCount(); i++) {
      sb.append(visit(tree.getChild(i)));
      if (i < tree.getChildCount() - 1) {
        sb.append(" ");
      }
    }

    sb.append(")");
    return sb.toString();
  }
}

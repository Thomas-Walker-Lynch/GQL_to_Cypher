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

  @Override
  public String visitGeneralLogarithmFunction(GQL_20240412Parser.GeneralLogarithmFunctionContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitGeneralLogarithmBase(GQL_20240412Parser.GeneralLogarithmBaseContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitGeneralLogarithmArgument(GQL_20240412Parser.GeneralLogarithmArgumentContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitCommonLogarithm(GQL_20240412Parser.CommonLogarithmContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNaturalLogarithm(GQL_20240412Parser.NaturalLogarithmContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitExponentialFunction(GQL_20240412Parser.ExponentialFunctionContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitPowerFunction(GQL_20240412Parser.PowerFunctionContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNumericValueExpressionBase(GQL_20240412Parser.NumericValueExpressionBaseContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNumericValueExpressionExponent(GQL_20240412Parser.NumericValueExpressionExponentContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNumericValueExpressionFactor(GQL_20240412Parser.NumericValueExpressionFactorContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNumericValueExpressionSummand(GQL_20240412Parser.NumericValueExpressionSummandContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNumericValueExpression(GQL_20240412Parser.NumericValueExpressionContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitBooleanValueExpressionBase(GQL_20240412Parser.BooleanValueExpressionBaseContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitBooleanValueExpressionFactor(GQL_20240412Parser.BooleanValueExpressionFactorContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitBooleanValueExpressionSummand(GQL_20240412Parser.BooleanValueExpressionSummandContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitBooleanValueExpression(GQL_20240412Parser.BooleanValueExpressionContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitFieldPath(GQL_20240412Parser.FieldPathContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNodeLabel(GQL_20240412Parser.NodeLabelContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitEdgeLabel(GQL_20240412Parser.EdgeLabelContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitLabel(GQL_20240412Parser.LabelContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNodeType(GQL_20240412Parser.NodeTypeContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitEdgeType(GQL_20240412Parser.EdgeTypeContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitType(GQL_20240412Parser.TypeContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitFieldName(GQL_20240412Parser.FieldNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNodeName(GQL_20240412Parser.NodeNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitEdgeName(GQL_20240412Parser.EdgeNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitAliasName(GQL_20240412Parser.AliasNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitTypeName(GQL_20240412Parser.TypeNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitLabelName(GQL_20240412Parser.LabelNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNonTypeName(GQL_20240412Parser.NonTypeNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitTypeVariableName(GQL_20240412Parser.TypeVariableNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitFieldVariableName(GQL_20240412Parser.FieldVariableNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNodeVariableName(GQL_20240412Parser.NodeVariableNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitEdgeVariableName(GQL_20240412Parser.EdgeVariableNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitVariableName(GQL_20240412Parser.VariableNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitDatabaseName(GQL_20240412Parser.DatabaseNameContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitDateString(GQL_20240412Parser.DateStringContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitTimeString(GQL_20240412Parser.TimeStringContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitDatetimeString(GQL_20240412Parser.DatetimeStringContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitDurationLiteral(GQL_20240412Parser.DurationLiteralContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitDurationString(GQL_20240412Parser.DurationStringContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNodeSynonym(GQL_20240412Parser.NodeSynonymContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitEdgesSynonym(GQL_20240412Parser.EdgesSynonymContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitEdgeSynonym(GQL_20240412Parser.EdgeSynonymContext ctx) {
    return visitChildren(ctx);
  }

  @Override
  public String visitNonReservedWords(GQL_20240412Parser.NonReservedWordsContext ctx) {
    return visitChildren(ctx);
  }


}

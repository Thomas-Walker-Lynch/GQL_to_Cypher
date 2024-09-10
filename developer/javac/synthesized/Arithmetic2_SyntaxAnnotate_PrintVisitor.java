/* This file synthesized by Synthesize_SyntaxAnnotate_PrintVisitor.
*/
import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

public class Arithmetic2_SyntaxAnnotate_PrintVisitor extends AbstractParseTreeVisitor<String> {
  private final String[] ruleNames;

  public Arithmetic2_SyntaxAnnotate_PrintVisitor(String[] ruleNames) {
    this.ruleNames = ruleNames;
  }

    public String visitgrammarSpec (Arithmetic2Parser.grammarSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("grammarSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitgrammarDecl (Arithmetic2Parser.grammarDeclContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("grammarDecl(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitgrammarType (Arithmetic2Parser.grammarTypeContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("grammarType(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitprequelConstruct (Arithmetic2Parser.prequelConstructContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("prequelConstruct(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitoptionsSpec (Arithmetic2Parser.optionsSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("optionsSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitoption (Arithmetic2Parser.optionContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("option(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitoptionValue (Arithmetic2Parser.optionValueContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("optionValue(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitdelegateGrammars (Arithmetic2Parser.delegateGrammarsContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("delegateGrammars(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitdelegateGrammar (Arithmetic2Parser.delegateGrammarContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("delegateGrammar(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visittokensSpec (Arithmetic2Parser.tokensSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("tokensSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitchannelsSpec (Arithmetic2Parser.channelsSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("channelsSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitidList (Arithmetic2Parser.idListContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("idList(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitaction_ (Arithmetic2Parser.action_Context ctx) {
    StringBuilder result = new StringBuilder();
    result.append("action_(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitactionScopeName (Arithmetic2Parser.actionScopeNameContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("actionScopeName(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitactionBlock (Arithmetic2Parser.actionBlockContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("actionBlock(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitargActionBlock (Arithmetic2Parser.argActionBlockContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("argActionBlock(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitmodeSpec (Arithmetic2Parser.modeSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("modeSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitrules (Arithmetic2Parser.rulesContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("rules(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleSpec (Arithmetic2Parser.ruleSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitparserRuleSpec (Arithmetic2Parser.parserRuleSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("parserRuleSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitexceptionGroup (Arithmetic2Parser.exceptionGroupContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("exceptionGroup(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitexceptionHandler (Arithmetic2Parser.exceptionHandlerContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("exceptionHandler(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitfinallyClause (Arithmetic2Parser.finallyClauseContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("finallyClause(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitrulePrequel (Arithmetic2Parser.rulePrequelContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("rulePrequel(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleReturns (Arithmetic2Parser.ruleReturnsContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleReturns(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitthrowsSpec (Arithmetic2Parser.throwsSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("throwsSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlocalsSpec (Arithmetic2Parser.localsSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("localsSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleAction (Arithmetic2Parser.ruleActionContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleAction(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleModifiers (Arithmetic2Parser.ruleModifiersContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleModifiers(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleModifier (Arithmetic2Parser.ruleModifierContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleModifier(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleBlock (Arithmetic2Parser.ruleBlockContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleBlock(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleAltList (Arithmetic2Parser.ruleAltListContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleAltList(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlabeledAlt (Arithmetic2Parser.labeledAltContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("labeledAlt(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerRuleSpec (Arithmetic2Parser.lexerRuleSpecContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerRuleSpec(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerRuleBlock (Arithmetic2Parser.lexerRuleBlockContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerRuleBlock(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerAltList (Arithmetic2Parser.lexerAltListContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerAltList(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerAlt (Arithmetic2Parser.lexerAltContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerAlt(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerElements (Arithmetic2Parser.lexerElementsContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerElements(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerElement (Arithmetic2Parser.lexerElementContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerElement(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerBlock (Arithmetic2Parser.lexerBlockContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerBlock(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerCommands (Arithmetic2Parser.lexerCommandsContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerCommands(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerCommand (Arithmetic2Parser.lexerCommandContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerCommand(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerCommandName (Arithmetic2Parser.lexerCommandNameContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerCommandName(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerCommandExpr (Arithmetic2Parser.lexerCommandExprContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerCommandExpr(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitaltList (Arithmetic2Parser.altListContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("altList(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitalternative (Arithmetic2Parser.alternativeContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("alternative(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitelement (Arithmetic2Parser.elementContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("element(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitpredicateOptions (Arithmetic2Parser.predicateOptionsContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("predicateOptions(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitpredicateOption (Arithmetic2Parser.predicateOptionContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("predicateOption(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlabeledElement (Arithmetic2Parser.labeledElementContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("labeledElement(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitebnf (Arithmetic2Parser.ebnfContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ebnf(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitblockSuffix (Arithmetic2Parser.blockSuffixContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("blockSuffix(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitebnfSuffix (Arithmetic2Parser.ebnfSuffixContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ebnfSuffix(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitlexerAtom (Arithmetic2Parser.lexerAtomContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("lexerAtom(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitatom (Arithmetic2Parser.atomContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("atom(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitnotSet (Arithmetic2Parser.notSetContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("notSet(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitblockSet (Arithmetic2Parser.blockSetContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("blockSet(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitsetElement (Arithmetic2Parser.setElementContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("setElement(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitblock (Arithmetic2Parser.blockContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("block(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitruleref (Arithmetic2Parser.rulerefContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("ruleref(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitcharacterRange (Arithmetic2Parser.characterRangeContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("characterRange(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitterminalDef (Arithmetic2Parser.terminalDefContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("terminalDef(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitelementOptions (Arithmetic2Parser.elementOptionsContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("elementOptions(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitelementOption (Arithmetic2Parser.elementOptionContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("elementOption(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }
  public String visitidentifier (Arithmetic2Parser.identifierContext ctx) {
    StringBuilder result = new StringBuilder();
    result.append("identifier(");
    for (int i = 0; i < ctx.getChildCount(); i++) {
      if (i > 0) result.append(", ");
      result.append(visit(ctx.getChild(i)));
    }
    result.append(")");
    return result.toString();
  }

}

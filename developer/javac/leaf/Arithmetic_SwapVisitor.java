import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;

public class Arithmetic_SwapVisitor extends AbstractParseTreeVisitor<ParseTree> {

    @Override
    public ParseTree visit(ParseTree tree) {
        if (tree instanceof ParserRuleContext) {
            ParserRuleContext ctx = (ParserRuleContext) tree;
            ParserRuleContext newCtx = new ParserRuleContext();

            // Recursively visit all children and add them to the new context
            for (int i = 0; i < ctx.getChildCount(); i++) {
                ParseTree child = ctx.getChild(i);
                ParseTree visitedChild = this.visit(child);
                
                // Add child if it's a valid type
                if (visitedChild instanceof ParserRuleContext) {
                    newCtx.addChild((ParserRuleContext) visitedChild);
                } else if (visitedChild instanceof TerminalNode) {
                    newCtx.addChild((TerminalNode) visitedChild);
                }
            }
            return newCtx;
        } else if (tree instanceof TerminalNode) {
            TerminalNode node = (TerminalNode) tree;
            // Swap operators based on text
            switch (node.getText()) {
                case "+":
                    return createTerminalNode(node, ArithmeticParser.MINUS); // Swap + with -
                case "-":
                    return createTerminalNode(node, ArithmeticParser.PLUS);  // Swap - with +
                case "*":
                    return createTerminalNode(node, ArithmeticParser.DIVIDE); // Swap * with /
                case "/":
                    return createTerminalNode(node, ArithmeticParser.MULTIPLY); // Swap / with *
                default:
                    return node; // Return node as is for non-operator tokens
            }
        }
        return null;
    }

    // Helper method to create a new TerminalNode with the swapped token
    private TerminalNode createTerminalNode(TerminalNode oldNode, int newTokenType) {
        Token newToken = new CommonToken(newTokenType, oldNode.getText());
        return new TerminalNodeImpl(newToken);
    }
}

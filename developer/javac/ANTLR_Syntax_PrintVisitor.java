import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;
import org.antlr.v4.runtime.tree.TerminalNode;

public class ANTLR_Syntax_PrintVisitor extends ANTLRv4ParserBaseVisitor<String> {

    private int indentLevel = 0;
    private boolean prettyPrint = false;
    private StringBuilder output = new StringBuilder();

    public ANTLR_Syntax_PrintVisitor() {
        this(false);
    }

    public ANTLR_Syntax_PrintVisitor(boolean prettyPrint) {
        this.prettyPrint = prettyPrint;
    }

    private void appendIndented(String message) {
        if (prettyPrint) {
            for (int i = 0; i < indentLevel; i++) {
                output.append("  ");
            }
        }
        output.append(message).append("\n");
    }

    @Override
    public String visitGrammarSpec(ANTLRv4Parser.GrammarSpecContext ctx) {
        appendIndented("grammarSpec");
        indentLevel++;
        visitChildren(ctx);
        indentLevel--;
        return output.toString();
    }

    @Override
    public String visitTerminal(TerminalNode node) {
        appendIndented(node.getText());
        return output.toString();
    }

    // Override other visit methods as needed for specific rules

}

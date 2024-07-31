// Generated from java-escape by ANTLR 4.11.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link GQL_testParser}.
 */
public interface GQL_testListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link GQL_testParser#root}.
	 * @param ctx the parse tree
	 */
	void enterRoot(GQL_testParser.RootContext ctx);
	/**
	 * Exit a parse tree produced by {@link GQL_testParser#root}.
	 * @param ctx the parse tree
	 */
	void exitRoot(GQL_testParser.RootContext ctx);
	/**
	 * Enter a parse tree produced by {@link GQL_testParser#query}.
	 * @param ctx the parse tree
	 */
	void enterQuery(GQL_testParser.QueryContext ctx);
	/**
	 * Exit a parse tree produced by {@link GQL_testParser#query}.
	 * @param ctx the parse tree
	 */
	void exitQuery(GQL_testParser.QueryContext ctx);
	/**
	 * Enter a parse tree produced by {@link GQL_testParser#field}.
	 * @param ctx the parse tree
	 */
	void enterField(GQL_testParser.FieldContext ctx);
	/**
	 * Exit a parse tree produced by {@link GQL_testParser#field}.
	 * @param ctx the parse tree
	 */
	void exitField(GQL_testParser.FieldContext ctx);
	/**
	 * Enter a parse tree produced by {@link GQL_testParser#value}.
	 * @param ctx the parse tree
	 */
	void enterValue(GQL_testParser.ValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link GQL_testParser#value}.
	 * @param ctx the parse tree
	 */
	void exitValue(GQL_testParser.ValueContext ctx);
	/**
	 * Enter a parse tree produced by {@link GQL_testParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(GQL_testParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link GQL_testParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(GQL_testParser.NumberContext ctx);
}
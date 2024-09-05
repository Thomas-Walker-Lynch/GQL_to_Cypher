/*
 * Accepts an grammar source file and outputs the rule names found in the grammar.
 * Accepts the same input structure as ANTLRv4_Syntax.java.
 * Usage: java ANTLRv4_RuleNames <input-file>
 */

import org.antlr.v4.runtime.*;
import java.util.List;

public class RuleNameList {

  public static void main(String[] args) {
    if (args.length != 1) {
      System.err.println("Usage: RuleNameList <grammar_name>");
      System.exit(1);
    }

    String grammarName = args[0];

    try {
      // Dynamically load the appropriate lexer and parser
      Class<?> lexerClass = Class.forName(grammarName + "Lexer");
      Class<?> parserClass = Class.forName(grammarName + "Parser");

      // Create instances of the lexer and parser
      Lexer lexer = (Lexer) lexerClass.getConstructor(CharStream.class).newInstance(CharStreams.fromString(""));
      CommonTokenStream tokens = new CommonTokenStream(lexer);
      Parser parser = (Parser) parserClass.getConstructor(TokenStream.class).newInstance(tokens);

      // Get the rule names from the parser
      List<String> ruleNames = List.of(parser.getRuleNames());

      // Print the rule names
      System.out.println("Rule names found in the grammar:");
      for (String ruleName : ruleNames) {
        System.out.println(ruleName);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

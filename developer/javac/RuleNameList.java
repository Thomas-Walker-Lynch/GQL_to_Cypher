/*
  Accepts an grammar name (not a file path or file name) and outputs the rule
  names found in the grammar.  

  RuleNameList does not run antlr to build the grammar files, that must have
  been done separately before this program is run.

  RuleNameList produces a more reliable list than does RuleNameListRegx.

  RuleNameList does not output terminal symbols (the lexer tokens).

  Usage: ANTLRv4_RuleNames <input-file>
*/

import org.antlr.v4.runtime.*;
import java.util.ArrayList;
import java.util.List;

public class RuleNameList {

  // Constant for the usage message
  private static final String USAGE_MESSAGE =
    "Usage: RuleNameList"
    +" [-version]"
    +" [-rule (default)] [-no-rule]"
    +" [-token] [-no-token (default)]"
    +" <grammar-name>"
    ;

  public static void main(String[] args) {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }
    boolean error = false;
    boolean version = false;
    boolean printRules = true;
    boolean printTokens = false;
    List<String> argList = new ArrayList<>();
    for (int i = 0; i < args.length; i++) {
      String arg = args[i];
      if (arg.startsWith("-")) {
        switch (arg) {
        case "-version":
          version = true;
          break;
        case "-rule":
          printRules = true;
          break;
        case "-no-rule":
          printRules = false;
          break;
        case "-token":
          printTokens = true;
          break;
        case "-no-token":
          printTokens = false;
          break;
        default:
          System.err.println("Unrecognized option: " + arg);
          error = true;
        }
      } else {
        argList.add(arg);
      }
    }
    if(version){
      System.out.println("version 0.1");
      if(error){
        System.exit(1);
      }else{
        System.exit(0);
      }        
    }
    if (argList.size() != 1) {
      System.err.println("Expected exactly one non-option argument.");
      error = true;
    }
    if(error){
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String grammarName = argList.get(0);
    // in case the user provided a path instead of a name:
    grammarName = Paths.get(grammarName).getFileName().toString().replace(".g4", "");

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

      // Get the token names from the lexer
      List<String> tokenNames = List.of(lexer.getTokenNames());

      // Print the rule names if requested
      if (printRules) {
        if (printTokens) {
          System.out.println("#----------------------------------------");
          System.out.println("# Rule names found in the grammar:");
        }
        for (String ruleName : ruleNames) {
          System.out.println(ruleName);
        }
      }

      // Print the token names if requested
      if (printTokens) {
        if (printRules) {
          System.out.println("#----------------------------------------");
          System.out.println("# Token names found in the grammar:");
        }
        for (String tokenName : tokenNames) {
          System.out.println(tokenName);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

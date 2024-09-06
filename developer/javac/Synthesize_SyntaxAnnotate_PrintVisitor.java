import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.io.PrintWriter;

public class Synthesize_SyntaxAnnotate_PrintVisitor {
  // Constant for the usage message
  private static final String USAGE_MESSAGE = 
    "Usage: Synthesize_SyntaxAnnotate_PrintVisitor"
    +"[-version]"
    +"<grammarFilePath> <outputFile> [indentLevel]"
    ;

  public static void main(String[] args) throws IOException {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String grammarFilePath = null;
    String outputFile = null;
    int indentLevel = 0;

    // Parse the arguments
    for (int i = 0; i < args.length; i++) {
      String arg = args[i];
      if (arg.startsWith("-")) {
        switch (arg) {
        case "-version":
          System.out.println("Version 0.1");
          System.exit(0);
          break;
        default:
          System.err.println("Unrecognized option: " + arg);
          System.err.println(USAGE_MESSAGE);
          System.exit(1);
        }
      } else {
        if (grammarFilePath == null) {
          grammarFilePath = arg;
        } else if (outputFile == null) {
          outputFile = arg;
        } else {
          indentLevel = Integer.parseInt(arg);
        }
      }
    }

    // Ensure there are exactly two or three arguments
    if (grammarFilePath == null || outputFile == null) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    // Extract the grammar name from the file name
    String grammarName = Paths.get(grammarFilePath).getFileName().toString().replace(".g4", "");
    String parserName = grammarName + "Parser";
    String visitorClassName = grammarName + "_SyntaxAnnotate_PrintVisitor";

    // Parse the .g4 file
    CharStream input = CharStreams.fromFileName(grammarFilePath);
    ANTLRv4Lexer lexer = new ANTLRv4Lexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ANTLRv4Parser parser = new ANTLRv4Parser(tokens);

    // Extract rules
    ParseTree tree = parser.grammarSpec();
    List<String> ruleNames = extractRuleNames(parser);

    // Synthesize the print methods
    StringBuilder printMethods = new StringBuilder();
    for (String ruleName : ruleNames) {
      printMethods.append(Synthesize_SyntaxAnnotate_PrintVisitorMethod.synthesizePrintMethod(parserName, ruleName, indentLevel + 1));
    }

    // Template for the PrintVisitor class
    String classTemplate = """
      /* This file synthesized by Synthesize_SyntaxAnnotate_PrintVisitor.
      */
      import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

      public class ____0_ extends AbstractParseTreeVisitor<String> {
        private final String[] ruleNames;

        public ____0_(String[] ruleNames) {
          this.ruleNames = ruleNames;
        }

        ____1_
      }
      """;

    classTemplate = classTemplate.replace("____0_", visitorClassName);
    classTemplate = classTemplate.replace("____1_", printMethods.toString());

    try (PrintWriter writer = new PrintWriter(outputFile)) {
      writer.print(classTemplate);
    }
  }

  private static List<String> extractRuleNames(Parser parser) {
    // Extract rule names from the parser
    return Arrays.asList(parser.getRuleNames());
  }
}

//  LocalWords:  SyntaxAnnotate PrintVisitor

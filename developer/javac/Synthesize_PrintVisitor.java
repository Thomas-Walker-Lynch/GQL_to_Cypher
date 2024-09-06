import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.io.PrintWriter;

public class Synthesize_PrintVisitor {
  // Constant for the usage message
  private static final String USAGE_MESSAGE = "Usage: java Synthesize_PrintVisitor <grammarFile> <outputFile> [indentLevel] " +
    "[-version]";

  public static void main(String[] args) throws IOException {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String grammarFile = null;
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
        if (grammarFile == null) {
          grammarFile = arg;
        } else if (outputFile == null) {
          outputFile = arg;
        } else {
          indentLevel = Integer.parseInt(arg);
        }
      }
    }

    // Ensure there are exactly two or three arguments
    if (grammarFile == null || outputFile == null) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    // Extract the grammar name from the file name
    String grammarName = Paths.get(grammarFile).getFileName().toString().replace(".g4", "");
    String parserName = grammarName + "Parser";

    // Parse the .g4 file
    CharStream input = CharStreams.fromFileName(grammarFile);
    ANTLRv4Lexer lexer = new ANTLRv4Lexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ANTLRv4Parser parser = new ANTLRv4Parser(tokens);

    // Extract rules
    ParseTree tree = parser.grammarSpec();
    List<String> ruleNames = extractRuleNames(parser);

    // Template for the PrintVisitor class
    String classTemplate = """
      import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

      public class PrintVisitor extends AbstractParseTreeVisitor<String> {
        private final String[] ruleNames;

        public PrintVisitor(String[] ruleNames) {
          this.ruleNames = ruleNames;
        }

        // Generated print methods
      """;

    // Indent the class template
    String indentedClassTemplate = StringUtils.indentString(classTemplate, indentLevel);

    // Generate and output the PrintVisitor class
    try (PrintWriter writer = new PrintWriter(outputFile)) {
      // Write the class template
      writer.print(indentedClassTemplate);

      for (String ruleName : ruleNames) {
        Synthesize_PrintVisitorMethod.generatePrintMethod(parserName, ruleName, writer, indentLevel + 1);
      }

      // Close the class
      writer.println(StringUtils.indentString("}", indentLevel));
    }
  }

  private static List<String> extractRuleNames(Parser parser) {
    // Extract rule names from the parser
    return List.of(parser.getRuleNames());
  }
}

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.io.PrintWriter;

public class GeneratePrintVisitor {

    public static void main(String[] args) throws IOException {
        if (args.length < 2 || args.length > 3) {
            System.err.println("Usage: java GeneratePrintVisitor <grammarFile> <outputFile> [indentLevel]");
            System.exit(1);
        }

        String grammarFile = args[0];
        String outputFile = args[1];
        int indentLevel = args.length == 3 ? Integer.parseInt(args[2]) : 0;

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
                GeneratePrintVisitorMethod.generatePrintMethod(parserName, ruleName, writer, indentLevel + 1);
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

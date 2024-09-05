import java.io.PrintWriter;

public class GeneratePrintVisitorMethod {

    public static void main(String[] args) {
        if (args.length != 3) {
            System.err.println("Usage: java GeneratePrintVisitorMethod <parserName> <ruleName> <outputFile>");
            System.exit(1);
        }

        String parserName = args[0];
        String ruleName = args[1];
        String outputFile = args[2];

        try (PrintWriter writer = new PrintWriter(outputFile)) {
            generatePrintMethod(parserName, ruleName, writer, 0); // Default indent level 0
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void generatePrintMethod(String parserName, String ruleName, PrintWriter writer, int indentLevel) {
        // Template for the print method using text blocks
        String template = """
          public String visit_______0_(_______1_._______0_Context ctx) {
            StringBuilder result = new StringBuilder();
            result.append("_______0_(");
            for (int i = 0; i < ctx.getChildCount(); i++) {
              if (i > 0) result.append(", ");
              result.append(visit(ctx.getChild(i)));
            }
            result.append(")");
            return result.toString();
          }
          """;

        // Fill in the blanks in the template
        template = template.replace("_______0_", ruleName);
        template = template.replace("_______1_", parserName);

        // Indent the template
        String indentedTemplate = StringUtils.indentString(template, indentLevel);

        // Write the template to the output file
        writer.print(indentedTemplate);
        writer.println();
    }
}

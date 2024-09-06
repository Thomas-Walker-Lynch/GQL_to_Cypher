import java.io.PrintWriter;

public class Synthesize_PrintVisitorMethod {
  // Constant for the usage message
  private static final String USAGE_MESSAGE = "Usage: java Synthesize_PrintVisitorMethod <parserName> <ruleName> <outputFile> " +
    "[-version]";

  public static void main(String[] args) {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String parserName = null;
    String ruleName = null;
    String outputFile = null;

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
        if (parserName == null) {
          parserName = arg;
        } else if (ruleName == null) {
          ruleName = arg;
        } else {
          outputFile = arg;
        }
      }
    }

    // Ensure there are exactly three arguments
    if (parserName == null || ruleName == null || outputFile == null) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    try (PrintWriter writer = new PrintWriter(outputFile)) {
      generatePrintMethod(parserName, ruleName, writer, 0); // Default indent level 0
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static void generatePrintMethod(String parserName, String ruleName, PrintWriter writer, int indentLevel) {
    // Template for the print method using text blocks
    String template = """
      public String visit____0_ (____1_. ____0_Context ctx) {
        StringBuilder result = new StringBuilder();
        result.append("____0_(");
        for (int i = 0; i < ctx.getChildCount(); i++) {
          if (i > 0) result.append(", ");
          result.append(visit(ctx.getChild(i)));
        }
        result.append(")");
        return result.toString();
      }
      """;

    // Fill in the blanks in the template
    template = template.replace("____0_", ruleName);
    template = template.replace("____1_", parserName);

    // Indent the template
    String indentedTemplate = StringUtils.indentString(template, indentLevel);

    // Write the template to the output file
    writer.print(indentedTemplate);
    writer.println();
  }
}

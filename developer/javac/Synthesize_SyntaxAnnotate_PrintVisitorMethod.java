import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;

public class Synthesize_SyntaxAnnotate_PrintVisitorMethod {
  // Constant for the usage message
  private static final String USAGE_MESSAGE = 
    "Usage: Synthesize_SyntaxAnnotate_PrintVisitorMethod"
    + " [-version]"
    +" <grammar-name> <g4-rule-name> <output-file>"
    ;

  public static void main(String[] args) {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }
    boolean error = false;
    boolean version = false;
    List<String> argList = new ArrayList<>();
    for (int i = 0; i < args.length; i++) {
      String arg = args[i];
      if (arg.startsWith("-")) {
        switch (arg) {
        case "-version":
          version = true;
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
    if (argList.size() != 3) {
      System.err.println("Expected exactly three non-option arguments.");
      error = true;
    }
    if(error){
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String grammarName = argList.get(0);
    String ruleName    = argList.get(1);
    String outputFile  = argList.get(2);

    String parserName = grammarName + "Parser";
    
    try {
      PrintWriter writer = new PrintWriter(outputFile);
      // start at indent level 0
      writer.print(synthesizePrintMethod(parserName, ruleName, 0)); 
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static String synthesizePrintMethod(String parserName, String ruleName, int indentLevel) {
    // Template for the print method using text blocks
    String template = """
      public String visit____0_ (____1_.____0_Context ctx) {
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
    return StringUtils.indentString(template, indentLevel);
  }
}

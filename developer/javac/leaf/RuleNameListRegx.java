/*
Directly reads an ANTLR grammar file, a `.g4` file, and lists all the rules found in it.

*/
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.ArrayList;
import java.util.List;

public class RuleNameListRegx {
  // Constant for the usage message
  private static final String USAGE_MESSAGE =
    "Usage: RuleNameListRegx [-version] <path-to-g4-file>";

  public static void main(String[] args) {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }
    boolean error = false;
    boolean version = false;
    boolean pretty_print = false;
    List<String> argList = new ArrayList<>();
    for (int i = 0; i < args.length; i++) {
      String arg = args[i];
      if (arg.startsWith("-")) {
        switch (arg) {
        case "-version":
          version = true;
          break;
        case "-pp":
          pretty_print = true;
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

    String filePath = argList.get(0);

    try {
      Set<String> ruleNames = new HashSet<>();
      BufferedReader br = new BufferedReader(new FileReader(filePath));
      StringBuilder content = new StringBuilder();
      String line;
      while ((line = br.readLine()) != null) {
        content.append(line).append("\n");
      }

      // Updated pattern to handle multi-line rules
      Pattern rulePattern = Pattern.compile("(?m)^\\s*([a-zA-Z_][a-zA-Z0-9_]*)\\s*:");

      Matcher matcher = rulePattern.matcher(content.toString());
      while (matcher.find()) {
        ruleNames.add(matcher.group(1));
      }

      System.out.println("Extracted Rules:");
      for (String rule : ruleNames) {
        System.out.println(rule);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}

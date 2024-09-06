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

public class RuleNameListRegx {
  // Constant for the usage message
  private static final String USAGE_MESSAGE = "Usage: java RuleNameListRegx <path-to-g4-file> " +
    "[-version]";

  public static void main(String[] args) {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String filePath = null;

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
        filePath = arg;
      }
    }

    // Ensure there is exactly one file path argument
    if (filePath == null) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    Set<String> ruleNames = new HashSet<>();

    try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
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

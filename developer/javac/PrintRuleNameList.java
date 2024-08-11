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

public class PrintRuleNameList {

  public static void main(String[] args) {
    if (args.length != 1) {
      System.out.println("Usage: java GrammarRuleExtractor <path-to-g4-file>");
      return;
    }

    String filePath = args[0];
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

/*
  Helper function to simplify the GQL grammar file by categorizing terminal symbols.

  Accepts a the terminal symbols category grammar file, and the original grammar file.

  Replaces each terminal symbol in the original grammar file with a corresponding category token.
*/
import java.io.*;
import java.nio.file.*;
import java.util.*;

public class TerminalToCategory {
  // Constant for the usage message
  private static final String USAGE_MESSAGE = "Usage: java TerminalToCategory <literalsFile> <originalFile> <outputFile> " +
    "[-version]";

  public static void main(String[] args) throws IOException {
    if (args.length == 0) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    String literalsFile = null;
    String originalFile = null;
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
        if (literalsFile == null) {
          literalsFile = arg;
        } else if (originalFile == null) {
          originalFile = arg;
        } else {
          outputFile = arg;
        }
      }
    }

    // Ensure there are exactly three arguments
    if (literalsFile == null || originalFile == null || outputFile == null) {
      System.err.println(USAGE_MESSAGE);
      System.exit(1);
    }

    Map<String, String> tokenMap = loadTokenMap(literalsFile);
    List<String> originalLines = Files.readAllLines(Paths.get(originalFile));

    // Print categories and their terminals
    printTokenMap(tokenMap);

    List<String> updatedLines = new ArrayList<>();

    for (int i = 0; i < originalLines.size(); i++) {
      String line = originalLines.get(i);
      String updatedLine = line;
      for (Map.Entry<String, String> entry : tokenMap.entrySet()) {
        String terminal = entry.getKey();
        String category = entry.getValue();

        // Use a regex to replace whole words only, and avoid replacing category names
        String regex = "\\b" + terminal + "\\b";
        if (!category.equals("CONTROL_FLOW") && updatedLine.matches(".*" + regex + ".*")) {
          // Print the substitution details
          System.out.println("Substituting " + terminal + " with " + category + 
                             " on line " + (i + 1) + ": " + updatedLine.trim());
          // Add a comment with the original rule
          updatedLines.add("// Original: " + updatedLine.trim());
          updatedLine = updatedLine.replaceAll(regex, category);
        }
      }
      updatedLines.add(updatedLine);
    }

    Files.write(Paths.get(outputFile), updatedLines);
    System.out.println("Substitution complete. Output written to " + outputFile);
  }

  private static Map<String, String> loadTokenMap(String literalsFile) throws IOException {
    Map<String, String> tokenMap = new HashMap<>();
    List<String> lines = Files.readAllLines(Paths.get(literalsFile));

    String currentToken = null;
    StringBuilder symbolsBuilder = new StringBuilder();

    for (String line : lines) {
      line = line.trim();
      if (line.isEmpty() || line.startsWith("//")) {
        continue;
      }
      if (line.contains(":")) {
        if (currentToken != null) {
          addSymbolsToMap(currentToken, symbolsBuilder.toString(), tokenMap);
        }
        String[] parts = line.split(":");
        currentToken = parts[0].trim();
        symbolsBuilder = new StringBuilder(parts[1].trim());
      } else if (line.endsWith(";")) {
        symbolsBuilder.append(" ").append(line.replace(";", "").trim());
        addSymbolsToMap(currentToken, symbolsBuilder.toString(), tokenMap);
        currentToken = null;
        symbolsBuilder = new StringBuilder();
      } else {
        symbolsBuilder.append(" ").append(line);
      }
    }
    return tokenMap;
  }

  private static void addSymbolsToMap(String token, String symbols, Map<String, String> tokenMap) {
    for (String symbol : symbols.split("\\s+")) {
      tokenMap.put(symbol, token);
    }
  }

  private static void printTokenMap(Map<String, String> tokenMap) {
    Map<String, List<String>> categorizedMap = new HashMap<>();

    for (Map.Entry<String, String> entry : tokenMap.entrySet()) {
      categorizedMap.computeIfAbsent(entry.getValue(), k -> new ArrayList<>()).add(entry.getKey());
    }

    for (Map.Entry<String, List<String>> entry : categorizedMap.entrySet()) {
      System.out.println("Category: " + entry.getKey());
      System.out.println("Terminals: " + String.join(", ", entry.getValue()));
      System.out.println();
    }
  }
}

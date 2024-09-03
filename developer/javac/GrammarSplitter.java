/*
Separates the grammar and lexer rules out into two files.

Purpose for this is so we can transform the grammar rules by collecting lexer tokens
into categories.
*/
import java.io.*;
import java.nio.file.*;
import java.util.*;

public class GrammarSplitter {

    public static void main(String[] args) throws IOException {
        String originalFile = "GQL_20240412.g4";
        String lexerFile = "lexer_rules.g4";
        String grammarFile = "grammar_rules.g4";
        
        List<String> originalLines = Files.readAllLines(Paths.get(originalFile));
        
        List<String> lexerLines = new ArrayList<>();
        List<String> grammarLines = new ArrayList<>();
        
        boolean isLexerSection = false;

        for (String line : originalLines) {
            line = line.trim();
            
            // Check if line starts a lexer rule or fragment
            if (isLexerRule(line)) {
                isLexerSection = true;
            }

            // Add the line to the correct section based on the current state
            if (isLexerSection) {
                lexerLines.add(line);
                // End of a lexer rule or fragment
                if (line.endsWith(";")) {
                    isLexerSection = false;
                }
            } else {
                grammarLines.add(line);
            }
        }
        
        Files.write(Paths.get(lexerFile), lexerLines);
        Files.write(Paths.get(grammarFile), grammarLines);
        
        System.out.println("Splitting complete. Lexer rules saved to " + lexerFile + ", Grammar rules saved to " + grammarFile);
    }
    
    private static boolean isLexerRule(String line) {
        // Identify lexer rules based on common patterns, capitalization, or presence of 'fragment'
        return line.matches("^(fragment\\s+|[A-Z]).*:\\s*.*") || line.matches(".*\\b(DIGIT|WHITESPACE|SP|LF|TAB|CR|FS|GS|RS|US|VT|FF|HEX_DIGIT)\\b.*");
    }
}

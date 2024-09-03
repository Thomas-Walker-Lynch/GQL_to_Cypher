/*

Accepts an antlr grammar file name of the form: [path/]<name>[Lexer/Parser][.g4]

Prints a space separated list of files antlr4 would output.

The <name>Lexer or <name>Parser suffix, or absence thereof, tell this program if
antlr would create lexer and parser files, or both.

The `-visitor` and `no-lsistner` options also affect the output, as they would
for antlr.

*/
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ANTLR_OUT_FL {

    public static void main(String[] args) {
        if (args.length == 0) {
            System.err.println("Usage: java ANTLR_OUT_FL <grammar-file> [-visitor] [-no-listener]");
            System.exit(1);
        }

        boolean visitor = false;
        boolean noListener = false;
        boolean noTokens = false;
        List<String> argList = new ArrayList<>();

        // Parse the arguments
        for (String arg : args) {
            if (arg.startsWith("-")) {
                switch (arg) {
                    case "-visitor":
                        visitor = true;
                        break;
                    case "-no-listener":
                        noListener = true;
                        break;
                    case "-no-tokens":
                        noTokens = true;
                        break;
                    default:
                        System.err.println("Unrecognized option: " + arg);
                        System.err.println("Usage: java ANTLR_OUT_FL <grammar-file> [-visitor] [-no-listener]");
                        System.exit(1);
                }
            } else {
                argList.add(arg);
            }
        }

        // Ensure there is exactly one grammar file argument
        if (argList.size() != 1) {
            System.err.println("Usage: java ANTLR_OUT_FL <grammar-file> [-visitor] [-no-listener]");
            System.exit(1);
        }

        String grammarFile = argList.get(0);

        List<String> generatedFiles = generateFileList(grammarFile, visitor, noListener ,noTokens);

        // Print the files in a space-separated format on a single line
        if (!generatedFiles.isEmpty()) {
            System.out.print(generatedFiles.get(0)); // Print the first file
            for (int i = 1; i < generatedFiles.size(); i++) {
                System.out.print(" " + generatedFiles.get(i)); // Print space and each subsequent file
            }
        }
        System.out.println(); // Print a newline at the end
    }

  public static List<String> generateFileList(String grammarFile, boolean visitor, boolean noListener ,boolean noTokens) {
        String baseName = new File(grammarFile).getName().replace(".g4", "");
        List<String> fileList = new ArrayList<>();

        // Determine if this is a lexer, parser, or both
        boolean isLexer = baseName.endsWith("Lexer");
        boolean isParser = baseName.endsWith("Parser");
        boolean isCombined = !isLexer && !isParser;

        if (isLexer || isCombined) {
            // Lexer files
            fileList.add(baseName + "Lexer.java");
            if (!noTokens) fileList.add(baseName + "Lexer.tokens");
        }

        if (isParser || isCombined) {
            // Parser files
            fileList.add(baseName + "Parser.java");
            if (!noTokens) fileList.add(baseName + ".tokens");

            // Listener-related files
            if (!noListener) {
                fileList.add(baseName + "Listener.java");
                fileList.add(baseName + "BaseListener.java");
            }

            // Visitor-related files
            if (visitor) {
                fileList.add(baseName + "Visitor.java");
                fileList.add(baseName + "BaseVisitor.java");
            }
        }

        return fileList;
    }
}

/*
Run the command with no arguments for a usage message.

Accepts an antlr grammar file name of the form: [path/]<name>[Lexer/Parser][.g4]

Prints a space-separated list of files antlr4 would output.

The <name>Lexer or <name>Parser suffix, or absence thereof, tell this program if
antlr would create lexer and parser files, or both.


*/

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ANTLR_OUT_FL {

    // Constant for the usage message
    private static final String USAGE_MESSAGE = "Usage: java ANTLR_OUT_FL <grammar-file> " +
            "[-visitor (default)] [-no-visitor] " +
            "[-listener] [-no-listener (default)] " +
            "[-tokens] [-no-tokens (default)] " +
            "[-path <path>]";

    public static void main(String[] args) {
        if (args.length == 0) {
            System.err.println(USAGE_MESSAGE);
            System.exit(1);
        }

        // Defaults
        boolean visitor = true;
        boolean noListener = true;
        boolean noTokens = true;
        String outputPath = "";  // Default empty path
        List<String> argList = new ArrayList<>();

        // Parse the arguments
        for (int i = 0; i < args.length; i++) {
            String arg = args[i];
            if (arg.startsWith("-")) {
                switch (arg) {
                    case "-visitor":
                        visitor = true;
                        break;
                    case "-no-visitor":
                        visitor = false;
                        break;
                    case "-listener":
                        noListener = false;
                        break;
                    case "-no-listener":
                        noListener = true;
                        break;
                    case "-tokens":
                        noTokens = false;
                        break;
                    case "-no-tokens":
                        noTokens = true;
                        break;
                    case "-path":
                        // Ensure the next argument exists and isn't another option
                        if (i + 1 < args.length && !args[i + 1].startsWith("-")) {
                            outputPath = args[++i];  // Get the next argument as the path
                            if (!outputPath.endsWith("/")) {
                                outputPath += "/";  // Ensure the path ends with a slash
                            }
                        } else {
                            System.err.println(USAGE_MESSAGE);
                            System.exit(1);
                        }
                        break;
                    default:
                        System.err.println("Unrecognized option: " + arg);
                        System.err.println(USAGE_MESSAGE);
                        System.exit(1);
                }
            } else {
                argList.add(arg);
            }
        }

        // Ensure there is exactly one grammar file argument
        if (argList.size() != 1) {
            System.err.println(USAGE_MESSAGE);
            System.exit(1);
        }

        String grammarFile = argList.get(0);

        List<String> generatedFiles = generateFileList(grammarFile, visitor, noListener, noTokens, outputPath);

        // Print the files in a space-separated format on a single line
        if (!generatedFiles.isEmpty()) {
            System.out.print(generatedFiles.get(0)); // Print the first file
            for (int i = 1; i < generatedFiles.size(); i++) {
                System.out.print(" " + generatedFiles.get(i)); // Print space and each subsequent file
            }
        }
        System.out.println(); // Print a newline at the end
    }

    public static List<String> generateFileList(String grammarFile, boolean visitor, boolean noListener, boolean noTokens, String outputPath) {
        String baseName = new File(grammarFile).getName().replace(".g4", "");
        List<String> fileList = new ArrayList<>();

        // Determine if this is a lexer, parser, or both
        boolean isLexer = baseName.endsWith("Lexer");
        boolean isParser = baseName.endsWith("Parser");
        boolean isCombined = !isLexer && !isParser;

        if (isLexer || isCombined) {
            // Lexer files
            fileList.add(outputPath + baseName + "Lexer.java");
            if (!noTokens) fileList.add(outputPath + baseName + "Lexer.tokens");
        }

        if (isParser || isCombined) {
            // Parser files
            fileList.add(outputPath + baseName + "Parser.java");
            if (!noTokens) fileList.add(outputPath + baseName + ".tokens");

            // Listener-related files
            if (!noListener) {
                fileList.add(outputPath + baseName + "Listener.java");
                fileList.add(outputPath + baseName + "BaseListener.java");
            }

            // Visitor-related files
            if (visitor) {
                fileList.add(outputPath + baseName + "Visitor.java");
                fileList.add(outputPath + baseName + "BaseVisitor.java");
            }
        }

        return fileList;
    }
}

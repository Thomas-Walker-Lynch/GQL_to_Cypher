package gql;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class EchoParser {
    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("Usage: java gql.EchoParser <input-file>");
            System.exit(1);
        }

        CharStream input = CharStreams.fromFileName(args[0]);
        GQLLexer lexer = new GQLLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        GQLParser parser = new GQLParser(tokens);

        ParseTree tree = parser.root(); // Adjust to match your grammar's start rule
        System.out.println(tree.toStringTree(parser));
    }
}

public class StringUtils {

    private static int spacesPerIndentLevel = 2; // Default to 2 spaces per indent level

    public static void setSpacesPerIndentLevel(int spaces) {
        spacesPerIndentLevel = spaces;
    }

    public static String indentString(String template, int indentLevel) {
        String indent = " ".repeat(spacesPerIndentLevel * indentLevel);
        String[] lines = template.split("\n");
        StringBuilder indentedTemplate = new StringBuilder();
        for (String line : lines) {
            indentedTemplate.append(indent).append(line).append("\n");
        }
        return indentedTemplate.toString();
    }
}

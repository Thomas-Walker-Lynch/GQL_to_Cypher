import java.util.Map;

public class TestBench {

    public static void runTests(Map<String, Boolean> tests) {
        int totalTests = tests.size();
        int passedTests = 0;
        int failedTests = 0;

        for (Map.Entry<String, Boolean> test : tests.entrySet()) {
            try {
                if (test.getValue()) {
                    passedTests++;
                } else {
                    System.out.println("failed: " + test.getKey());
                    failedTests++;
                }
            } catch (Exception e) {
                System.out.println("failed: " + test.getKey());
                failedTests++;
            }
        }

        System.out.println("Total tests run: " + totalTests);
        System.out.println("Total tests passed: " + passedTests);
        System.out.println("Total tests failed: " + failedTests);
    }
}

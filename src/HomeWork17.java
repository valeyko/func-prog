import java.util.Arrays;

public class HomeWork17 {
    public static int[] getDigitsByNumber(int[] numbers, int n) {
        return Arrays.stream(numbers)
                .map(x -> Integer.toString(x).length() >= n ? (x / (int) Math.pow(10, n - 1)) % 10 : 0)
                .toArray();
    }

    public static void main(String[] args) {
        int[] numbers = {563, 5243, 76796, 1};
        System.out.println(Arrays.toString(getDigitsByNumber(numbers, 3)));
    }
}

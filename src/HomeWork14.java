import java.util.Arrays;

public class HomeWork14 {
    public static int[] nonZeroLastDigits(int[] numbers) {
        return Arrays.stream(numbers)
                .filter(x -> String.valueOf(x).length() == 2)
                .map(x -> x % 10)
                .toArray();
    }

    public static void main(String[] args) {
        int[] numbers = {354, 20, 9, 31, 75};
        System.out.println(Arrays.toString(nonZeroLastDigits(numbers)));
    }
}

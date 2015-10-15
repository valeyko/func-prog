import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

public class HomeWork11 {
    public static Predicate<Integer> checkDigitCurried(Integer digit) {
        String c = digit.toString();
        if (c.length() != 1) {
            throw new RuntimeException(digit + " is not a digit!");
        }
        return x -> x.toString().contains(c);
    }

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(15535);
        list.add(1312);
        list.add(12344);
        System.out.println(list.stream().allMatch(checkDigitCurried(3)));
        System.out.println(checkDigitCurried(3).test(12));
    }
}

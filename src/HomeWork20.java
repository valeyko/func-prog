import java.util.Iterator;
import java.util.stream.IntStream;

/**
 * Created by Mikhail.Valeyko on 06.11.2015.
 */
public class HomeWork20 {
    public static Iterable<Integer> dividers(int n) {
        return () -> IntStream.rangeClosed(2, n - 1).filter(x -> n % x == 0).iterator();
    }

    public static void main(String[] args) {
        Iterator<Integer> it = dividers(30).iterator();

        // get first N dividers
        final int N = 3;
        for (int i = 0; it.hasNext() && i < N; i++) {
            System.out.println(it.next());
        }
    }
}
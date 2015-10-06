import java.util.ArrayList;
import java.util.List;

public class HomeWork8 {
    public static boolean isEachListHasAnyEven(List<List<Integer>> lists) {
        return lists.stream().allMatch(list -> list.stream().anyMatch(x -> x % 2 == 0));
    }

    public static void main(String[] args) {
        List<Integer> list1 = new ArrayList<>();
        list1.add(1);
        list1.add(2);
        list1.add(3);

        List<Integer> list2 = new ArrayList<>();
        list2.add(1);
        list2.add(3);
        list2.add(3);

        List<List<Integer>> lists = new ArrayList<>();
        lists.add(list1);
        lists.add(list2);

        System.out.println(isEachListHasAnyEven(lists));
    }
}

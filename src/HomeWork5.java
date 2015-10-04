public class HomeWork5 {
    private final static int N = 100;

    private HomeWork5() {
    }

    public static double integral(IntegrableFunction f, double a, double b) {
        double h = (b - a) / N;
        double sum = 0;
        for (int i = 1; i < N; i += 2) {
            double x1 = a + i * h;
            sum += f.value(x1 - h) + 4 * f.value(x1) + f.value(x1 + h);
        }

        return h / 3 * sum;
    }

    public static void main(String[] args) {
        System.out.println(integral(x -> x * x, 0, 1));
    }

    interface IntegrableFunction {
        double value(double x);
    }
}

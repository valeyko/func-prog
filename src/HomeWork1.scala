object HomeWork1 {
  // 1
  def f(n: Int): BigInt = if (n == 1) 4 else f(n - 1) * f(n - 1)

  // 2
  def g(n: Int): BigInt = g_(n, 1)
  def g_(n: Int, s: BigInt): BigInt = if (n == s) s else s + 10 * g_(n, s + 1)

  // 3
  def sumcos(n: Int): Double = sumcos_(n, 0, 0)
  def sumcos_(n: Int, s: Double, p: Double): Double =
    if (n == 0) math.cos(s) / p else sumcos_(n - 1, s + n, p + math.cos(n))

  // 4
  def sumfact(n: Int): BigInt = sumfact_(n, 1, 1, 0)
  def sumfact_(n: Int, i: Int, f: BigInt, s: BigInt): BigInt =
    if (n == 0) s else sumfact_(n - 1, i + 1, f * i, s + f * i)

  def main(args: Array[String]): Unit = {
    print(sumfact(3))
  }
}
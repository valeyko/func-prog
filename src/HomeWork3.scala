object HomeWork3 {
  // 1
  def minlist(xs: List[Int]): Int = xs match {
    case x :: Nil => x
    case x :: xs => min(x, minlist(xs))
  }

  def min(x: Int, y: Int) = if (x <= y) x else y

  // 2
  def minsum(xs: List[Int]): Int = xs match {
    case a :: b :: Nil => a + b
    case a :: b :: xs => min(a + b, minsum(b :: xs))
  }

  // 3
  def check(cond: Int => Boolean, xs: List[Int]): Boolean = xs match {
    case x :: Nil => cond(x)
    case x :: xs => if (cond(x)) true else check(cond, xs)
  }

  // 4
  def checkSum(xs: List[Int]): Boolean = xs match {
    case a :: b :: Nil => a + b == 10
    case a :: xs => if (check((x: Int) => a + x == 10, xs)) true else checkSum(xs)
  }

  def main(args: Array[String]): Unit = {
    print(checkSum(List(3, 2, 9, 7)))
  }
}
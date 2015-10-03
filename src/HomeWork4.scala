object HomeWork4 {
  // 1
  def upDown(xs: List[Int]) = upDown_(xs, false)
  def upDown_(xs: List[Int], called: Boolean): Boolean = xs match {
    case a :: b :: Nil => if (called) a > b else false
    case a :: b :: xs => if (a < b) upDown_(b :: xs, true)
                         else if (called) down(a :: b :: xs) else false
  }
  def down(xs: List[Int]): Boolean = xs match {
    case a :: b :: Nil => a > b
    case a :: b :: xs => if (!(a > b)) false else down(b :: xs)
  }

  def main(args: Array[String]) {
    println(upDown(List(2, 6, 9, 7, 3, 1)))
  }
}

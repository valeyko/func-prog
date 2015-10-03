object HomeWork6 {
  // 1
  def isosc(p1: (Int, Int), p2: (Int, Int), p3: (Int, Int)): Boolean = {
    def sqr(x: Double) = math.pow(x, 2)
    def sqrLen(p1: (Int, Int), p2: (Int, Int)): Double = sqr(p1._1 - p2._1) + sqr(p1._2 - p2._2)

    val ls: (Double, Double, Double) = (sqrLen(p1, p2), sqrLen(p2, p3), sqrLen(p3, p1))
    ls._1 == ls._2 || ls._2 == ls._3 || ls._3 == ls._1
  }

  // 2
  def sumprod(xs: List[Int]): Int = {
    var sum = 0
    xs.zip(xs.tail).foreach((t: (Int, Int)) => sum += t._1 * t._2)
    sum
  }

  // 3
  abstract class Tree
  object Empty extends Tree
  case class Node(elem: Int, l: Tree, r: Tree) extends Tree

  def height(t: Tree): Int = t match {
    case Empty => -1
    case Node(_, l, r) => math.max(height(l), height(r)) + 1
  }

  // 4
  abstract class Candy
  case class Cake(name: String, price: Double) extends Candy
  case class Sweet(name: String, pricePerKg: Double, weight: Double) extends Candy

  def totalPrice(xs: List[Candy]): Double = totalPrice_(xs, 0)
  def totalPrice_(xs: List[Candy], acc: Double): Double = xs match {
    case Nil => acc
    case Cake(_, price) :: xs => totalPrice_(xs, acc + price)
    case Sweet(_, pricePerKg, weight) :: xs => totalPrice_(xs, acc + pricePerKg * weight)
  }

  def main(args: Array[String]): Unit = {
    println(height(Node(1, Node(1, Empty, Node(1, Empty, Empty)), Empty)))
    println(totalPrice(List(Cake("Санчо", 500), Sweet("Белочка", 100, 5), Sweet("Степ", 400, 2))))
  }
}
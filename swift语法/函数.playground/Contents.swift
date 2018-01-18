//: Playground - noun: a place where people can play

import UIKit

// 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的.可选的元组类型，整个 元组是可选的(可能有值，可能是nil)，而不只是元组中的每个元素值。

// 输入输出参数：
// 如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数，输入输出参数不能有默认值
func swapTwoInts(_ a: inout Int,_ b : inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var x = 10
var y = 50
swapTwoInts(&x, &y)
print("x=\(x),y=\(y)")

// 使用函数类型: 定义一个类型为函数的常量或变量
var mathFunction: (inout Int, inout Int) -> Void = swapTwoInts(_:_:)
mathFunction(&x,&y)
print("x=\(x),y=\(y)")

// 函数类型作为参数类型
func addInts(a: Int, b: Int) -> Int {
    return a + b
}
func printMathResult(_ math:(Int , Int) -> Int,_ a: Int ,b: Int) {
    print("Result: \(math(a,b))")
}
printMathResult(addInts(a:b:), 10, b: 20)

// 函数类型作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward:Bool) -> (Int) -> Int {
    return backward ? stepForward : stepBackward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print(moveNearerToZero)

// 嵌套函数: 把函数定义在别的函数体中
func choosFuction(backward:Bool) -> (Int) -> Int {
    func add(input: Int) -> Int {return input + 1}
    func reduce(input: Int) -> Int {return input - 1}
    return backward ? add : reduce
}




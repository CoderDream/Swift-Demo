//: Playground - noun: a place where people can play

import UIKit

// *************************** 函数类型 ***************************
// 函数和方法中的参数名并不是函数类型的一部分
func someFunction(left: Int, right: Int) {}
func anotherFunction(left: Int, right: Int) {}
func functionWithDifferentLabels(top: Int, bottom: Int) {}

// 函数f的类型为（Int, Int） -> Void ，而不是(left: Int, right: Int) -> Void
var f = someFunction
f = anotherFunction
f = functionWithDifferentLabels

// 正确
func functionWithDifferentArgumentTypes(left: Int,right: String) {}
func functionWithDifferentNumberOfArguments(left: Int,right: Int,top:Int) {}

// 错误
//f = functionWithDifferentArgumentTypes
//f = functionWithDifferentNumberOfArguments

// 如果一个函数类型包涵多个箭头（->），那么函数类型将从右向左进行组合，例如，函数类型： Int -> Int -> Int 可以理解为 Int -> (Int -> Int)，也就是说，该函数类型的参数为Int类型，其返回类型是一个参数类型为Int,返回类型为 Int 的函数类型

// *************************** 数组类型 ***************************
let someArray: Array<String> = ["Alex","Brian","Dave"]
let someArrayTwo: [String] = ["Alex","Brian","Dave"]

// *************************** 字典类型 ***************************
let someDictionary: [String : Int] = ["Alex": 31,"Paul":39]
let someDictionaryTwo: Dictionary<String,Int> = ["Alex": 31,"Paul": 39]

// *************************** 可选类型 ***************************
var optionalInteger: Int?
var optionalIntegerTwo: Optional<Int>
// 类型Optional<Wrapped> 是一个枚举，有俩个成员，none 和 some<Wrapped>,用来表示可能有也可能没有的值，任意类型都可以被显示地声明（或隐式地转换）为可选类型。如果你在声明或定义可选变量或属性的时候没有提供初始值，它的值则会自动赋为默认值nil

// *************************** 元类型 ***************************
// 你可以使用后缀self表达式来获取类型，比如，SomeClass.self 返回SomeClass本身，而不是SomeClass的一个实例。同样，SomeProtocol.self返回SomeProtocol本身，而不是运行时符合SomeProtocol的某个类型的实例。还可以对类型的实例使用type(of:)表达式来获取该实例在运行阶段的类型
class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}

class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}

let someInstance: SomeBaseClass = SomeSubClass()
// someInstance 在编译期是someBaseClass 类型
// 但是在运行期间则是 SomeSubClass类型
type(of: someInstance)
type(of: someInstance).printClassName()
someInstance.self

// 可以使用恒等运算符 === 和 ！== 来测试一个实例的运行时类型和它额编译时类型是否一致
if type(of: someInstance) === someInstance.self {
    print("The dynamic and static type of someInstance are the same")
} else {
    print("The dynamic and static type of someInstance are different")
}


















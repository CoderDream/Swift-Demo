//: Playground - noun: a place where people can play

import UIKit

// 泛型代码让你能够根据自定义的需求，编写出适用于任意类型、灵活可重用的函数及类型，它能让你避免代码的重复，用一种清晰和抽象的方式来表达代码的意图
// ********************************* 泛型函数 *********************************
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var a = 10
var b = 20
swapTwoValues(&a, &b)
a
b

// ********************************* 类型函数 *********************************
// 在上面的例子中，占位类型T是类型参数的一个例子。类型参数指定并命名一个占位类型，并且紧随在函数名后面，使用一对尖括号括起来(例如<T>)。你可提供多个类型参数，将它们都写在尖括号中，用逗号分开

// ********************************* 泛型类型 *********************************
// 除了泛型函数，swift还允许你定义泛型类型，这些自定义类、结构体和枚举可以适用于任何类型，类似于array 和 dictionary.
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfString = Stack<String>()
stackOfString.push(item: "uno")
stackOfString.push(item: "dos")
stackOfString.push(item: "tres")
stackOfString.push(item: "cuatro")


// ***************************** 扩展一个泛型类型 *****************************
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let topItem = stackOfString.topItem {
    print("The top item on the stack is \(topItem).")
}

// ***************************** 类型约束 *****************************
// swapTwoValues(_:_:)函数 和 Stack 类型可以作用于任何类型，不过，有的时候如果能将使用在泛型函数和泛型类型中的类型添加一个特定的类型约束，将会是非常有用的，类型约束可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合
// 类型约束语法
func someFunction<T: Int>(someT: T) {
    // 这里是泛型函数的函数体部分
}

// ***************************** 关联类型 *****************************
// 定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定，可以通过associatedtype关键字来指定关联类型
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int {get}
    subscript(i: Int) -> ItemType {get}
}

struct StackTwo: Container {
    // 原始实现部分
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // Container 协议的实现部分
    typealias ItemType = Int
    mutating func append(item: Int) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}





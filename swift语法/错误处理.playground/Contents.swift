//: Playground - noun: a place where people can play

import UIKit

// 1、表示并抛出错误
// 在swift中，错误用符合Error协议的类型的值来表示，这个空协议表明该类型可以用于错误处理
// swift的枚举类型尤为适合构建一组相关的错误状态，枚举的关联值还可以提供错误状态的额外信息
enum VendingMachineError: Error {
    case invalidSelection // 选择无效
    case insufficientFunds(coinsNeeded: Int) // 金额不足
    case outOfStock // 缺货
}
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

// 2、处理错误
// 某个错误被抛出时，附近的某部分代码必须负责处理这个错误，例如纠正这个问题、尝试另外一种方式、或是向用户报告错误。
// Swift 中有 4 种处理错误的方式。你可以把函数抛出的错误传递给调用此函数的代码、用 do-catch 语句处理错 误、将错误作为可选类型处理、或者断言此错误根本不会发生。
// 当一个函数抛出一个错误时，你的程序流程会发生改变，所以重要的是你能迅速识别代码中会抛出错误的地 方。为了标识出这些地方，在调用一个能抛出错误的函数、方法或者构造器之前，加上 try 关键字，或者 tr y? 或 try! 这种变体。这些关键字在下面的小节中有具体讲解。

// 2.1 用throwing 函数传递错误
// 为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上 throws 关键字。一个标有throws关键字的函数被称作throwing 函数。如果这个函数指明了返回值类型， throws 关键词需要写在箭头( - > )的前面。
// 一个 throwing 函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。
func canThrowErrors() throws -> String {return ""}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    func vend(itemName name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newitem = item
        newitem.count -= 1
        inventory[name] = newitem
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String,vendingMaching: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMaching.vend(itemName: snackName)
}
// 2.2 用do-Catch 处理错误
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMaching: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

// 2.3 讲错误转换成可选值
// 可以使用 try? 通过将错误转换成一个可选值来处理错误。如果在评估 try? 表达式时一个错误被抛出，那么表达 式的值就是 nil 。例如,在下面的代码中, x 和 y 有着相同的数值和等价的含义:
func someThrowingFunction() throws -> Int {
    // ...
    return 0
}
let x = try? someThrowingFunction()
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

// 如果你想对所有的错误都采用同样的方式来处理，用 try? 就可以让你写出简洁的错误处理代码。例如，下面的代 码用几种方式来获取数据，如果所有方式都失败了则返回 nil :
func fetchDataFromDisk() throws -> Data {
    return Data()
}
func fetchDataFromServer() throws -> Data {
    return Data()
}
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}
fetchData()




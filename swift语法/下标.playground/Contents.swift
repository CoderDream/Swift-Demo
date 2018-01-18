//: Playground - noun: a place where people can play

import UIKit

/// 下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。语法类似于实例方法语 法和计算型属性语法的混合。与定义实例方法类似，定义下标使用 subscript 关键字，指定一个或多个输入参数 和返回类型;与实例方法不同的是，下标可以设定为读写或只读。这种行为由 getter 和 setter 实现，有点类 似计算型属性:

// 下面演示了只读下标的实现
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")



//: Playground - noun: a place where people can play

import UIKit

(1,"apple") < (1, "bird") // true ,因为 1 相同，但是apple小于bird

// **************************** 空合运算符：？？****************************
// 空合运算符 ?? 将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值b,其中表达式a 必须是可选类型，默认值b的类型必须要和 a 储存值得类型保持一致
var a: Int? = nil
let b: Int = 200
a = a ?? b
print("a is \(a)")


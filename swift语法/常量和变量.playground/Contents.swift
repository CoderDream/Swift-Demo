//: Playground - noun: a place where people can play

import UIKit

/// ******************************* 变量 *******************************
/// 你可以在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型标注：
var red, green, blue:Double

/// ******************************* 元组 *******************************
/// 元组把多个值组合成一个复合值，元组内的值可以是任意类型，并不要求是相同类型
let http404Error = (404,"Not Found")

// 可以将一个元组的内容分解成单独的常量和变量
let (status, statusMessage) = http404Error
print("The status code is \(status)")
print("The status message is \(statusMessage)")

// 需要一部分元组值 ，用 _
let (justTheStatusCode, _) = http404Error

// 使用下标来访问元组中的单个元素
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")


/// 定义元组的时候给单个元素命名
let http200Status = (statusCode: 200,description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

/// *********************** 可选类型（处理值缺失的情况）: ? ************************
/// 可选类型（处理值缺失的情况）: ?
/// serverResponseCode 包含一个可选的Int 值404
var serverResponseCode: Int? = 404

// serverResponseCode 现在不包含值
serverResponseCode = nil

/// 如果声明一个可选常量或者变量但是没有赋值，它们会自动被设置为nil:
var surveyAnswer: String?
print("The value is \(surveyAnswer)")

/// *********************** if 语句以及强制解析 ************************
// 确定可选类型确实包含值之后，可以在可选的名字后面加 ！来获取值：“我知道这个可选有值，请使用它”，称为可选值的强制解析
let convertedNumber: Int? = 100
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

/// *********************** 可选绑定：判断可选类型是否包含值 ************************
let possibleNumber = "hello world"
if let actualNumber = Int(possibleNumber) {
    print("\(actualNumber) is a integer")
} else {
    print("\(possibleNumber) is a string")
}

/// *********************** 隐式解析可选类型 ************************
// 有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。这种类型的可选状态被定义为隐式解析可选类型(implicitly unwrapped optionals)。
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! //需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // 不需要感叹号

/// *********************** 错误处理 ************************
/// 这个函数有可能抛出错误 用throws 声明
func canThrowAnError() throws {
    
}

// 一个函数可以通过在声明中添加throws关键词来抛出错误消息。当你的函数能抛出错误消息时, 你应该在表达式中前置try关键词。
do {
    try canThrowAnError()
} catch  {
    
}









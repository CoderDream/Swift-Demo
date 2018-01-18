//: Playground - noun: a place where people can play

import UIKit

// ****************************** 初始化空字符串 *****************************
/// 以下俩个字符串均为空并且等价
var emptyString = ""   // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法

if emptyString.isEmpty {
    print("Nothing to see here")
}

/// 通过for-in 循环来遍历字符串中的每个字符
var variableString: String = "Horse"
for character in variableString {
    print(character)
}

/// += : 将一个字符串添加到一个已经存在字符串变量上
var instruction = "look over"
instruction += " there"
print("\(instruction)")
instruction.insert("!", at: instruction.endIndex)

/// 判断字符串相等
let quotation = "We are a lot alike, you and i"
let sameQuotation = "We are a lot alike, you and i"
if quotation == sameQuotation {
    print("These two strings are considered equal.")
}





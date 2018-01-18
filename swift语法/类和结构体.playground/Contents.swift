//: Playground - noun: a place where people can play

import UIKit

// ****************************** 类和结构体 ******************************
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()
someVideoMode.resolution.width
someVideoMode.interlaced

/// 结构体类型的成员逐一构造器 ，与结构体不同，类实例没有默认的成员逐一构造器
let vga = Resolution(width: 100, height: 120)
print(vga.width,vga.height)

/**
 *  结构体和枚举是值类型，值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
 *  在swift中，所有的基本类型：整数、浮点数、布尔值、字符串、数组和字典，都是值类型，并且在底层都是以结构体的形式所实现的
 */

/** 类是引用类型： 引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝
 */

/// 恒等运算符: === ，判定俩个常量或者变量是否引用同一个类实例
let tenEighty = VideoMode()
let alsoTenEighty = VideoMode()
let thanTenEight = tenEighty
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same  instance.")
} else if tenEighty === thanTenEight {
    print("tenEighty and thanTenEight refer to the same instance.")
}

/** 字符串、数组、和字典类型的赋值与复制行为:
    swift中，许多基本类型，例如string，array，dictionary类型均以结构体的形式实现，这意味着被赋值给新的常量或变量，或者被传入函数或方法中时它们的值会被拷贝
 
    Objective-C 中 NSString ， NSArray 和 NSDictionary 类型均以类的形式实现，而并非结构体。它们在被赋值或 者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
 */



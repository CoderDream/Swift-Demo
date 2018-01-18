//: Playground - noun: a place where people can play

import UIKit

// ************************** switch *****************************

/// switch可以使用: 区间匹配
let approximateCount = 62
var naturalCount : String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1...5:
    naturalCount = "a few"
case 5..<60:
    naturalCount = "several"
case 60..<1000:
    naturalCount = "dozens of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount)")

// 可以使用元组在同一个switch语句中测试多个值，元组中的元素可以是值，也可以是区间，另外，使用下划线（_）来匹配所有可能的值
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("(0,0) is at the origin")
case (_,0):
    print("(\(somePoint.0),0) is on the x-axis")
case (0,_):
    print("(0,\(somePoint.1)) is on the y-axis")
case (-2...2,-2...2):
    print("(\(somePoint.0),\(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0),\(somePoint.1)) is outside of the box")
}

// 使用值绑定来分类下图中的点
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case (_,_):
    print("somewhere else ")
}

// where case 分支的模式可以使用where 语句来判断额外的条件
let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("is on the line x == y")
case let (x, y) where x == -y:
    print("is on the line x == -y")
case let (x, y):
    print("is just some arbitrary point")
}

// 监测API可用性 : 在iOS 10 及更高的系统下运行；在macOS中，仅在macOS10.12及更高才会运行，最后一个参数，* ，是必须的，用于指定在所有其他平台中,，如果版本号高于你的设 备指定的最低版本，if语句的代码块将会运行。
if #available(iOS 10,macOS 10.12, *) {
    print("current doing")
} else {
    print("old do")
}










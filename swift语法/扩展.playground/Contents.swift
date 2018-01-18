//: Playground - noun: a place where people can play

import UIKit


// 扩展可以为已有类型添加计算型实例属性和计算型类型属性
// ********************** 计算型属性 **********************
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印 “One inch is 0.0254 meters”
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

// ****************************************** 构造器 ******************************************
// 扩展可以为已有类型添加新的构造器。这可以让你扩展其它类型，将你自己的定制类型作为其构造器参数，或者提供该类型的原始实现中未提供的额外初始化选项。
// 扩展能为类添加新的便利构造器，但是它们不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供。
// 如果你使用扩展为一个值类型添加构造器，同时该值类型的原始实现中未定义任何定制的构造器且所有存储属性 提供了默认值，那么我们就可以在扩展中的构造器里调用默认构造器和逐一成员构造器。 正如在值类型的构造器代理 (页 0)中描述的，如果你把定制的构造器写在值类型的原始实现中，上述规则将不 再适用。

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}
// 因为结构体 Rect 未提供定制的构造器，因此它会获得一个逐一成员构造器。又因为它为所有存储型属性提供了 默认值，它又会获得一个默认构造器。
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point.init(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))

// ****************************************** 可变实例方法 ******************************************
// 通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self 或其属性的方法必须将该实例 方法标注为 mutating ，正如来自原始实现的可变方法一样。
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

// ****************************************** 下标 ******************************************
// 扩展可以为已有类型添加新下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]

// ****************************************** 嵌套类型 ******************************************
// 扩展可以为已有的类、结构体和枚举添加新的嵌套类型:
extension Int {
    enum kind {
        case Negative, Zero, Positive
    }
    var kind: kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}




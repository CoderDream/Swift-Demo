//: Playground - noun: a place where people can play

import UIKit

// *********************** 属性 ***********************
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
// FixedLengthRange 的实例包含一个名为 firstValue 的变量存储属性和一个名为 length 的常量存储属性，在上面的例子中，length 在创建实例的时候被初始化，因为它是一个常量存取属性，所以之后无法修改它的值
// rangeOfThreeItems.length = 10

/// 常量结构体的存取属性: 如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行，如下firstValue length 属性无法修改
/// 这种行为是由于结构体属于值类型，当值类型的实例被声明为常量的时候，它的所有属性也就成了常量
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6
//rangeOfFourItems.length = 10

/// 只读计算属性： 只有getter没有setter的计算属性就是只读计算属性
struct Cuboid {
    var width = 0.0,height = 0.0,depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
//fourByFiveByTwo.volume = 200
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

/// 计算属性
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    } }
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))") // 打印 "square.origin is now at (10.0, 10.0)”

// 属性观察器： 属性观察器监控和响应属性值得的变化，每次属性值被设置的时候都会调用属性观察器
// willSet: 在新的值被设置之前调用 didSet: 在新的值被设置之后立即调用
class StepCounter {
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300

// 类型属性语法： 使用关键字 static 来定义类型属性.在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父 类的实现进行重写。下面的例子演示了存储型和计算型类型属性的语法:
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty : Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeStructure.computedTypeProperty)
print(SomeClass.computedTypeProperty)

// 类型方法: 在方法的func关键字之前加上关键字static，来指定类型方法。类还可以用关键字class来允许重写父类的方法实现
// 在类型方法的方法体中，self指向这个类型本身，而不是类型的某个实例
class ClassDemo {
    static var name = "xiao ming"
    class func someTypeMethod() {
        // 在这里实现类型方法
        self.name = "xiao hong"
        print("name is \(self.name)")
    }
}
ClassDemo.someTypeMethod()










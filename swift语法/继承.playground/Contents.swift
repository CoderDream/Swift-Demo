//: Playground - noun: a place where people can play

import UIKit

// ***************************** 重写 *****************************
// 子类可以为继承来的实例方法，类方法，实例属性，或下标提供自己定制的实现。我们把这种行为叫重写。
/// 在合适的地方，你可以通过使用 super 前缀来访问超类版本的方法，属性或下标:• 在方法 someMethod() 的重写实现中，可以通过 super.someMethod() 来调用超类版本的 someMethod() 方法。• 在属性 someProperty 的 getter 或 setter 的重写实现中，可以通过 super.someProperty 来访问超类版本的 someProperty 属性。• 在下标的重写实现中，可以通过 super[someIndex] 来访问超类版本中的相同下标。

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

// 重写属性:

// ******************** 重写属性的 Getters 和 Setters: ***********************
/// 你可以提供定制的 getter(或 setter)来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的 属性。子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。你在 重写一个属性时，必需将它的名字和类型都写出来。这样才能使编译器去检查你重写的属性是与超类中同名同类 型的属性相匹配的。
/// 你可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供 getter 和 setter 即 可。但是，你不可以将一个继承来的读写属性重写为一个只读属性。

/// 注意
/// 如果你在重写属性中提供了 setter，那么你也一定要提供 getter。如果你不想在重写版本中的 getter 里修改 继承来的属性值，你可以直接通过 super.someProperty 来返回继承来的值，其中 someProperty 是你要重写的属 性的名字。

class Train: Vehicle {
    override var description: String {
        get {
            return super.description + ": Train"
        }
        set {
           super.description + newValue
        }
    }
}
let train = Train()
print("train description: \(train.description)")
train.description = ": set train!`"
print("set train description: \(train.description)")

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// ***************************** 重写属性观察器 *****************************
/// 你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置 的，所以，为它们提供 willSet 或 didSet 实现是不恰当。此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已 经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

// ***************************** 防止重写 *****************************
// 通过把方法、属性或者下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可
class Person {
    final var name = "xiaoming"
    var age = 25
    final func sing() {
        
    }
}
//class Someone: Person {
//    override var name: String {
//        get {
//            return super.name
//        }
//        set {
//
//        }
//    }
//    final override func sing() {
//
//    }
//}


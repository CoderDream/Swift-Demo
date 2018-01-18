//: Playground - noun: a place where people can play

import UIKit

// **************************** 属性要求 ******************************

/** 协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。协议不指定属性是存储型属性还是计算型属性，它只指定属性的名称和类型。此外，协议还指定属性是可读的还是可读可写的。
    如果协议要求属性是可读可写的，那么该属性不能是常量属性或只读的计算型属性。如果协议只要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的。
    协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属 性则用 { get } 来表示:
 */
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
var john = Person(fullName: "John appleseed")

// **************************** 方法要求 ******************************

// 协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是，不支持为协议中的方法的参数提供默认值。

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator:RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

// **************************** Mutating 方法要求 ******************************

// 有时需要在方法中改变方法所属的实例，例如，在值类型（即结构体和枚举）的实例方法中，将mutating关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值
// 注意，实现协议中的mutating方法时，若是类类型，则不用写mutating关键字，而对于结构体和枚举，则必须写mutating关键字
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

// **************************** 构造器要求 ******************************
// 协议可以要求遵循协议的类型实现指定的构造器
// 你可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器，无论哪种情况，你都必须为构造器实现标上required修饰符

protocol someProco {
    init(someParameter: Int)
}

class SomeClass: someProco {
    required init(someParameter: Int) {
        
    }
}

// **************************** 协议作为类型 ******************************
// 尽管协议本身并未实现任何功能，但是协议可以被当做一个成熟的类型来使用。
// 1、可以作为函数、方法或构造器中的参数类型或返回值类型； 2、作为常量、变量或属性的类型； 3、作为数组、字典或其他容器中的元素类型
// 下面是将协议作为类型使用的例子：
// generator 属性的类型为 RandomNumberGenerator，因此任何遵循了 RandomNumberGenerator 协议的类型的实例都可以赋值给 generator，除此之外并无其他要求。
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

// **************************** 协议的继承 ******************************
// 协议能够继承一个或多个其他协议 ，可以在继承的协议的基础上增加新的要求，协议的继承语法与类的继承相似，多个被继承的协议间用逗号分割:
protocol PrettyTextRepresentable: someProco {
    var prettyTextualDescription: String {get}
}
// 例子中定义了一个新的协议 PrettyTextRepresentable ，它继承自 someProco 协议，任何遵循 PrettyTextRepresentable 协议的类型在满足该协议的要求时，也必须满足 someProco 协议的要求

// **************************** 类类型专属协议 ******************************
// 你可以在协议的继承列表中，通过添加class关键字来限制协议只能被类类型遵循，而结构体或枚举不能遵循该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：
protocol SomeClassOnlyProtocol: class, someProco {
    // 这里是类类型专属协议的定义部分
}

// **************************** 协议合成 ******************************
// 有时候需要同时遵循多个协议，你可以将多个协议采用 SomeProtocol & AnotherProtocol 这样的格式进行组合，称为协议合成，你可以罗列任意多个你想要遵循的协议，以与符号（&）分隔
protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}
struct Personal: Named,Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday,\(celebrator.name),you are \(celebrator.age)!")
}
let birthdayPerson = Personal(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

// **************************** 检查协议一致性 ******************************
// 使用 is 和 as 操作符来检查协议一致性，即是否符合某协议，并且可以转换到指定的协议类型
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal: HasArea {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 242_610),
    Animal(legs: 4)
]
// 当迭代出的元素符合 HasArea 协议时，将 as? 操作符返回的可选值通过可选绑定，绑定到 objectWithArea 常量上。objectWithArea是 HasArea 协议类型的实例，因此 area 属性可以被访问和打印
for objects in objects {
    if let objectWithArea = objects as? HasArea {
        print("Area is \(objectWithArea)")
    } else {
        print("Something that do not have an area")
    }
}

// **************************** 可选的协议要求 ******************************
// 遵循协议的类型可以选择是否实现这些要求，在协议中使用optionnal关键字作为前缀来定义可选要求，可选要求用在你需要和object-c打交道的代码中。协议和可选要求都必须带上@objc 属性。标记@objc特性的协议只能被继承自object-c类的类或者@objc类遵循，其他类以及结构体和枚举均不能遵循这种协议
@objc protocol CounterDataSource {
   @objc optional func incrementForCount(count: Int) -> Int
   @objc optional var fixedIncrement: Int { get }
}


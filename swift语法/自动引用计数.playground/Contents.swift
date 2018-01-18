//: Playground - noun: a place where people can play

import UIKit

// ****************************** 类实例之间的循环强引用 ******************************
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?
// 这个person实例已经有三个强引用了
reference1 = Person(name: "xiaoming")
reference2 = reference1
reference3 = reference1
// 给其中俩个变量赋值nil断开俩个强引用，只留下一个强引用
reference1 = nil
reference2 = nil
// 第三个最后一个强引用被断开时，ARC会销毁它
reference3 = nil

// *********************** 解决实例之间的循环强引用 ***********************
/** swift提供了俩种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用（weak reference）和无主引用（unowned reference）
    弱引用和无主引用允许循环引用中的一个实例引用而另外一个实例不保持强引用，这样实例能够互相引用而不产生循环强引用
 
    当其他的实例有更短的生命周期时，使用弱引用，也就是说，当其他实例析构在先时。在上面公寓的例子中，很显然一个公寓在它的生命周期内会在某个时间段没有它的主人，所以一个弱引用就加在公寓类里面，避免循环引用。相比之下，当其他实例有相同的或者更长生命周期时，请使用无主引用。
 *
 */

// 弱引用
// 当ARC设置弱引用为nil时，属性观察不会被触发
class Man {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Man?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
var john: Man?
var unit4A: Apartment?

john = Man(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john
// Man实例依然保持对Apartment实例的强引用，但是Apartment实例只持有对man实例的弱引用，这意味着当你断开john变量所保持的强引用时，再也没有指向man实例的强引用了
// 由于再也没有指向man实例的强引用，该实例会被销毁
john = nil
unit4A = nil

// 无主引用
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64,customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}
// Customer 实例持有对CreditCard实例的强引用，而CreditCard实例持有对Customer实例的无主引用
var hn: Customer?
hn = Customer(name: "Xiao Ye")
hn!.card = CreditCard(number: 1234_5678_9012_3456, customer: hn!)

hn = nil

/** 1、Man 和Apartment的例子展示了俩个属性的值都允许为nil,并会潜在产生循环强引用，这种情况最适合用弱引用来解决
    2、Customer 和 CreditCard 的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil,这也可能会产生循环强引用，这种场景最适合通过无主引用来解决
    3、俩个属性都必须有值，并且初始化完成后永远不会为nil，在这种场合中，需要一个类使用无主属性，而另一个类使用隐式解析可选属性
 *
 */
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name) is capital city is called \(country.capitalCity.name)")

// ****************************** 闭包引起的循环强引用 ******************************

/** 循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例时。这个闭包体重可能访问了实例的某个属性，例如self.somePropety,或者闭包中调用了实例的某个方法，例如self.someMethod()。这俩种情况都导致了闭包“捕获”self,从而产生了循环强引用
 
    循环强引用的产生，是因为闭包和类相似，都是引用类型
 
    swift 提供了一种优雅的方法来解决这个问题，称之为闭包捕获列表
 *
 **/
// 解决闭包引起的循环强引用
/**
 *  在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。捕
 获列表定义了闭包体内捕获一个或者多个引用类型的规则。跟解决两个类实例间的循环强引用一样，声明每个捕
 获的引用为弱引用或无主引用，而不是强引用。应当根据代码关系来决定使用弱引用还是无主引用。
 
 注意
 Swift 有如下要求:只要在闭包内使用 self 的成员，就要用 self.someProperty 或者 self.someMethod() (而 不只是 someProperty 或 someMethod() )。这提醒你可能会一不小心就捕获了 self 。
 **/

// 捕获列表中的每一项都由一对元素组成，一个元素是 weak 或 unowned 关键字，另一个元素是类实例的引用(例如 self )或初始化过的变量(如 delegate = self.delegate! )。这些项在方括号中用逗号分开。
//  lazy var someClosure: (Int, String) -> String = {
//     [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in // 这里是闭包的函数体
//}

// 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字 in 放在闭包 最开始的地方:
//  lazy var someClosure: Void -> String = {
//     [unowned self, weak delegate = self.delegate!] in // 这里是闭包的函数体
//   }

// 如果被捕获的引用绝对不会变为 nil ，应该用无主引用，而不是弱引用。

// 弱引用和无主引用
// 在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为 无主引用 。相反的，在被捕获的引用可能会变为 nil 时，将闭包内的捕获定义为 弱引用 。弱引用总是可选类型，并且当引用 的实例被销毁后，弱引用的值会自动置为 nil 。这使我们可以在闭包体内检查它们是否存在。

//class HTMLElement {
//    let name: String
//    let text: String?
//    lazy var asHTML: Void -> String = {
//        [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())
//paragraph = nil


//: Playground - noun: a place where people can play

import UIKit

// ************************** 自定义构造过程 *************************
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)

// ************************** 可选属性类型 *************************
/// 如果你定制的类型包括一个逻辑上允许取值为空的存取型属性---无论是因为它无法在初始化时赋值，还是因为它在之后某个时间点可以赋值为空--你都需要将它定义为可选类型，可选类型的属性将自动化初始化为nil,表示这个属性是有意在初始化时设置为空的。
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes , I do like cheese."

// ************************** 默认构造器 *************************
/// 如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默 认构造器(default initializers)。这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

// ************************** 结构体的逐一成员构造器 *************************
// 除了上面提到的默认构造器，如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存取型属性没有默认值
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

// ************************** 值类型的构造器代理 *************************
/// 构造器可以通过调用其他构造器来完成实例的部分构造过程，这一过程称为构造器代理，它能减少多个构造器间的代码重复
// 对于值类型，你可以使用self.init 在自定义的构造器中引用相同类型中的其他构造器，并且你只能在构造器内部调用self.init
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {
        
    }
    init(origin: Point,size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size:Size) {
        let orginX = center.x - (size.width / 2)
        let orginY = center.y - (size.height / 2)
        self.init(origin: Point.init(x: orginX, y: orginY), size: size)
    }
}

// ************************** 类的继承和构造过程 *************************
/// 类里面的所有存取型属性----包括所有继承自父类的属性----都必须在构造过程中设置初始值
/// swift 为类类型提供了俩种构造器来确保实例中所有存取型属性都能获取初始值，它们分别是指定构造器和便利构造器

/// 类的构造器代理规则
/** 规则 1 指定构造器必须调用其直接父类的的指定构造器。
规则 2 便利构造器必须调用同类中定义的其它构造器。
规则 3 便利构造器必须最终导致一个指定构造器被调用。
一个更方便记忆的方法是:
• 指定构造器必须总是向上代理 • 便利构造器必须总是横向代理
 */

// 构造器的继承和重写
// 子类可以在初始化时修改继承来的变量属性，但是不能修改继承来的常量属性
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
class Bicycle: Vehicle {
    override init() {
         super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bycycle: \(bicycle.description)")

// 指定构造器和便利构造器实践
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[unnamed]]")
    }
}
let namedMeat = Food(name: "Bacon")
print(namedMeat.name)
let mysteryMeat = Food()
print(mysteryMeat.name)
// 注意，RecipeIngredient的便利构造器 init(name: String)使用了跟Food中指定构造器 init(name: String)相同的参数。由于这个便利构造器重写了父类的指定构造器init(name: String)，因此必须在前面使用override修饰符
// 尽管RecipeIngredient将父类的指定构造器重写为了便利构造器，它依然提供了父类的所有指定构造器的实现，因此，RecipeIngredient会自动继承父类的所有便利构造器。
// RecipeIngredient的父类是Food，它有一个便利构造器init（），这个便利构造器会被RecipeIngredient继承。这个继承版本的init（）在功能上跟Food提供的版本是一样的，只是它会代理到RecipeIngredient版本的 init(name: String) 而不是Food提供的版本
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
oneMysteryItem.quantity
let oneBacon = RecipeIngredient(name: "Bacon")
oneMysteryItem.quantity
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

// ************************** 可失败构造器 *************************
// 如果一个类、结构体或枚举类型的对象，在构造过程中有可能失败，则为其定义一个可失败构造器。这里所指的失败是指。如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不满足某种必要的条件等。语法：在init关键字后面添加问好（init?）.
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {return nil}
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

// ************************** 必要构造器 *************************
// 在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器:
class SomeClass {
    required init() {
        
    }
}

class SomeSubclass: SomeClass {
    required init() {
        
    }
}

// ************************** 通过闭包或函数设置属性的默认值 *************************
// 如果某个存储型属性的默认值需要一些定制或设置，你可以使用闭包或全局函数为其提供定制的默认值。每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。
// 这种类型的闭包或函数通常会创建一个跟属性类型相同的临时变量，然后修改它的值以满足预期的初始状态，最后返回这个临时变量，作为属性的默认值。
// 注意闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。
class SomeClassDemo {
    let someProperty: Int = {
           // 在这个闭包中给 someProperty 创建一个默认值
        return 10
    }()
}









//: Playground - noun: a place where people can play

import UIKit

/** 枚举常被用于为特定类或结构体实现某些功能，类似的，枚举可以方便地定义工具类或结构体，从而为某个复杂的类型所使用，为了实现这种功能，swift允许你定义嵌套类型，可以在支持的类型中定义嵌套的枚举、类和结构体
 *
 */
//struct BlackjackCard {
//    // 嵌套的 Suit 枚举
//    enum Suit: Character {
//        case Spades = "?", Hearts = "?", Diamonds = "?", Clubs = "?"
//    }
//    // 嵌套的 Rank 枚举
//    enum Rank: Int {
//        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
//        case Jack, Queen, King, Ace
//    struct Values {
//        let first: Int, second: Int?
//    }
//    var values: Values {
//        switch self {
//        case .Ace:
//            return Values(first: 1, second: 11)
//        case .Jack, .Queen, .King:
//            return Values(first: 10, second: nil)
//        default:
//            return Values(first: self.rawValue, second: nil)
//        }
//    }
//}
//// BlackjackCard 的属性和方法
//    let rank: Rank, suit: Suit var description: String {
//var output = "suit is \(suit.rawValue),"
//output += " value is \(rank.values.first)"
//if let second = rank.values.second {
//    output += " or \(second)"
//}
//return output
//}
//}


//: Playground - noun: a place where people can play

import UIKit

// **************************** 数组（Array） ****************************
var someInts = [Int]()
someInts.append(3)
print(someInts)
// 置空
someInts = []
print(someInts)

/// 通过两个数组相加：+ 创建一个数组 ，数值类型值要一样
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

/// 利用下标来一次改变一系列数据值，即使新数据和原有数据的数量不是一样的
var shoppingList = ["Chocolate Spread","Cheese","Butter","Flour"]
shoppingList[1...3] = ["Bananas","Apples"]
print(shoppingList)

// 数组的遍历
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)) : \(value)")
}

// **************************** 集合(Set) ****************************
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
print("Current letters is \(letters)")
letters = [] // 置空
print("Current letters have \(letters.count) items")

// 用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print("FavoriteGenres is \(favoriteGenres)")

//Swift 的 Set 类型没有确定的顺序，为了按照特定顺序来遍历一个 Set 中的值可以使用 sorted() 方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// **************************** 字典 ****************************

/// 创建一个空字典
var namesOfIntegers = [Int : String]()
namesOfIntegers[16] = "sixteen"
print("namesofIntegers is \(namesOfIntegers)")

var airport:[String : String] = ["YYZ":"Toronto Person","DUB":"Dublin"]
// 如果有值 就修改该值 如果没有值 就添加此值
airport["LHR"] = "London"
print("airport is \(airport)")
// 置空该键值对 可以使用nil
airport["LHR"] = nil
print("Current airport is \(airport)")



//: Playground - noun: a place where people can play

import UIKit

// 通过 john.residence 来设定 address 属性也会失败，因为 john.residence 当前为 nil
// 下面代码中的赋值过程是可选链式调用的一部分，这意味着可选链式调用失败时，等号右侧的代码不会被执 行。

// let someAddress = Address()
// someAddress.buildingNumber = "29"
// someAddress.street = "Acacia Road"
// john.residence?.address = someAddress

// 可以通过可选链式调用来调用方法,并判断是否调用成功,即使这个方法没有返回值
// 这个方法没有返回值，然而，没有返回值的方法具有隐式的返回类型 Void 这意味着没有返回值的方法也会返回 ()，或者说空的元组
// 如果在可选值上通过可选链式调用来调用这个方法，该方法的返回类型会是 Void? ，而不是 Void ，因为通过可选 链式调用得到的返回值都是可选的。这样我们就可以使用 if 语句来判断能否成功调用
func printNumberOfRooms() {
    print("The number of rooms is ")
}

// 通过可选链式调用访问下标
// 通过可选链式调用，我们可以在一个可选值上访问下标，并且判断下标调用是否成功
// 通过可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。可选链式调用的问号一般直接跟在可选表达式的后面

// 访问可选类型的下标
var testScores = ["Dave": [86, 82, 84],"Bev": [79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
print("\(testScores)")




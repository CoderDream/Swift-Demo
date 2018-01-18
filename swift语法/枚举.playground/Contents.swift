//: Playground - noun: a place where people can play

import UIKit

// ********************************* 枚举 *******************************
// 在使用原始值为整数或者字符串类型的枚举时 ，不需要显式地为每一个枚举成员设置原始值，当使用整数作为原始值时，隐式赋值的值依次递增1 ，当使用字符串作为原始值时，其原始值为它本身
enum CompassPoint: String {
    case north, south, east, west
}
let sunsetDirection = CompassPoint.west.rawValue
print(sunsetDirection)



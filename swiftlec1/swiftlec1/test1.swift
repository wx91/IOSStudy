//
//  File.swift
//  swiftlec1
//
//  Created by wangx on 15/5/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

import Foundation
//使用 class 和类名来创建一个类。类中属性的声明和常量、变量声明一样,唯一的区别就是 它们的上下文是类。同样,方法和函数声明也一样。
class Shape{
    var numberOfSider=0;
    func simpleDescription()->String{
        return "A shape with \(numberOfSider) siders."
    }
}
//var shape=Shape();
//shape.numberOfSider=7
//var shapeDescription=shape.simpleDescription();
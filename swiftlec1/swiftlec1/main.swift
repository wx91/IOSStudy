//
//  main.swift
//  swiftlec1
//
//  Created by wangx on 15/5/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

import Foundation

println("Hello, World!");
//简单值
//使用 let 来声明常量,使用 var 来声明变量。
//一个常量的值在编译时并不需要获取,但是你
//只能为它赋值一次。也就是说你可以用常量来表示这样一个值:你只需要决定一次,但是需 要使用很多次。
//常量或者变量的类型必须和你赋给它们的值一样。然而,声明时类型是可选的,声明的同时 赋值的话,编译器会自动推断类型。编译器推断myVariable 是一个整 数(integer)因为它的初始值是整数
var myVariable = 42;
myVariable=50;
let myConstant=42;
print(myVariable);
print(myConstant);

//如果初始值没有提供足够的信息(或者没有初始值),那你需要在变量后面声明类型,用冒 号分割。
let implicitInteger=70;
let implicitDouble=70.0;
let explicationDouble:Double=70;
let implicitFloat :Float=4;
print(implicitFloat);
print(explicationDouble);

//值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型,请显式转换
let label="This width is "
let width=94;
let widthLabel=label+String(width);
print(widthLabel);

//有一种更简单的把值转换成字符串的方法:把值写到括号中,并且在括号之前写一个反斜杠。例如:
let apples=3;
let oranges=5;
let appleSummary="I have \(apples) apples ";
let fruitSummary="I have \(apples+oranges) pieces of fruit ."

//使用方括号[]来创建数组和字典,并使用下标或者键(key)来访问元素。
var shoppingList=["catfish","water","tulips","blue paint"];
shoppingList[1]="bottle of water";
print(shoppingList[1])

var occupations=[
    "Malcolm":"Captain",
    "Kaylee":"Mechnic"
];
occupations["Jayne"]="Public Relations";
print(occupations);

//要创建一个空数组或者字典，使用初始化语法
let emptyArray=[String]();
let emptyDictionary=Dictionary<String,Float>();
//如果类型信息可以被推断出来,你可以用[]和[:]来创建空数组和空字典——就像你声明变 量
//或者给函数传参数的时候一样。
shoppingList=[];


//控制流
//使用 if 和 switch 来进行条件操作,使用 for-in、for、while 和 do-while 来进行循环。包裹条
//件和循环变量括号可以省略,但是语句体的大括号是必须的。
//在 if 语句中,条件必须是一个布尔表达式——像 if score { ... }这样的代码是错误的。
let individualScores=[75,43,103,87,12];
var teamScore=0;
for score in individualScores {
    if score>50 {
    teamScore+=3;
    }else{
    teamScore+=1;
    }
}
print(teamScore);

//你可以一起使用 if 和 let 来处理值缺失的情况。有些变量的值是可选的。一个可选的值可能 是一个具体的值或者是 nil,表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的
var optionalString:String?="Hello";
optionalString==nil;

var optionalName:String?="John Appleseed";
var greeting="Hello!";
if let name=optionalName{
    greeting="Hello, \(name)";
}

//如果变量的可选值是 nil,条件会判断为 false,大括号中的代码会被跳过。如果不是 nil,会 将值赋给 let 后面的常量,这样代码块中就可以使用这个值了。

//switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
let vegetable="red pepper"
switch vegetable{
    case "celery":
        let vegetableComment="Add some raisins and make ants on a log."
    case "cucumber","watercress":
        let vegetableComment="That would make a goog tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment="Is it a spicy \(x)"
default:
    let vegetableComment="Everything tastes good in soup"
}
//运行 switch 中匹配到的子句之后,程序会退出 switch 语句,并不会继续向下运行,所以不 需要在每个子句结尾写 break。


let interestingNumbers=[
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]
var largest=0
for(kind ,numbers) in interestingNumbers{
        for number in numbers{
    if number>largest{
        largest=number
    }
        }
}

//使用 while 来重复运行一段代码直到不满足条件。循环条件可以在开头也可以在结尾。
var n=2;
while n<100{
    n=n*2
}
print(n);

var m=2
do{
    m=m*2
}while m<100
print(m)
//你可以在循环中使用...来表示范围,也可以使用传统的写法,两者是等价的:
var firstForLoop=0;
for i in 0...3{
    firstForLoop+=i;
}
print(firstForLoop);

var secondForLoop=0
for var i=0;i<3;++i{
    secondForLoop+=1;
}
print(secondForLoop);

//函数和闭包

func greet(name:String,day:String)->String{
    return "Hello \(name) , today is \(day)."
}
greet("Bob", "Tuesday");
print(greet("Bob", "Tuesday"))

//使用一个元组来返回多个值。
func getGasPrices()->(Double,Double,Double){
    return (3.59,3.69,3.79)
}
print(getGasPrices())
//函数的参数数量是可变的,用一个数组来获取它们:
func sumOf(numbers:Int...)->Int{
    var sum=0
    for number in numbers{
        sum+=number
    }
    return sum
}
print(sumOf());
print(sumOf(42,597,12))
//函数可以嵌套。被嵌套的函数可以访问外侧函数的变量,你可以使用嵌套函数来重构一个太 长或者太复杂的函数。

func returnFifteen()->Int{
    var y=10
    func add(){
        y+=5
    }
    add()
    return y;
}
returnFifteen();
//函数可以作为另一个函数的返回值
func makeIncrementer()->(Int->Int){
    func addOne(number:Int)->Int{
        return 1+number;
    }
    return addOne
}
var increment=makeIncrementer()
increment(7)

//函数也可以当做参数传入另一个函数。
func hasAnyMatches(list:[Int],condition:Int->Bool)->Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number:Int)->Bool{
        return number<10
}
var numbers=[20,19,7,12];
hasAnyMatches(numbers, lessThanTen);

//函数实际上是一种特殊的闭包,你可以使用{}来创建一个匿名闭包。使用 in 来分割参数并返 回类型。
numbers.map({
    (number:Int)->Int in
        let result=3*number
        return result;
    })


class Shape{
        var numberOfSider=0;
        func simpleDescription()->String{
    return "A shape with \(numberOfSider) siders."
        }
}
var shape=Shape();
shape.numberOfSider=7
var shapeDescription=shape.simpleDescription();

//一个构造函数来初始化类实例。使用 init 来 创建一个构造器。
class NamedShape{
    var numberOfSider:Int=0;
    var name:String
    
    init(name:String){
        self.name=name
    }
    
    func simpleDescription()->String{
                return "A shape with \(numberOfSider) siders.";
    }
}
//self 被用来区别实例变量。当你创建实例的时候,像传入函数参数一样给类传入构造 器的参数。每个属性都需要赋值

//子类的定义方法是在它们的类名后面加上父类的名字,用冒号分割。创建类的时候并不需要 一个标准的根类,所以你可以忽略父类。
//子类如果要重写父类的方法的话,需要用 override 标记——如果没有添加 override 就重写 父类方法的话编译器会报错。编译器同样会检测 override 标记的方法是否确实在父类中。
class Square:NamedShape{
    var sideLength:Double
    
    init(sideLength:Double,name:String){
        self.sideLength=sideLength;
        super.init(name: name)
        numberOfSider=4
    }
    func area()->Double{
            return sideLength*sideLength;
    }
    
    override func simpleDescription() -> String {
                return "A square with sides of length \(sideLength)."
    }
}
let test=Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription();

//属性可以有 getter 和 setter 。
class EquilateralTriangle:NamedShape{
    var sideLength:Double=0.0
    
    init(sideLength:Double,name:String){
        self.sideLength=sideLength;
        super.init(name: name);
        numberOfSider=3
    }
    var perimeter:Double{
            get{
            return 3.0*sideLength;
            }
            set{
                sideLength=newValue/3.0
            }
    }
    override func simpleDescription() -> String {
                    return "An Equilateral Triangle with sides of length \(sideLength)"
    }
}
var triangle=EquilateralTriangle(sideLength: 3.1, name: "a triangle"););
triangle.perimeter;
triangle.perimeter=9.9
triangle.sideLength
//注意 EquilateralTriangle 类的构造器执行了三步: 1. 设置子类声明的属性值
//2. 调用父类的构造器
//3. 改变父类定义的属性值。其他的工作比如调用方法、getters 和 setters 也可以在这个阶 段完成。








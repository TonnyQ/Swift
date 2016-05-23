//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//a simple function
func greeting(name:String)->String{
    let greetingMessage = "Hello" + name
    return greetingMessage
}

var ss = greeting //as a argument
print(ss("tonny"))

//multi arguments function
func greeting2(name1:String,name2:String)->String{
    let greetingMessage = "Hello," + name1 + name2
    return greetingMessage
}

//No argument function
func greeting0()->String
{
    return "Hello,Swift."
}

//No return value function,return void(an empty tuple)
func greeting3()
{
    print("no return value")
}

//return optional type value
func greeting4(name:String?)->String?{
    if let theName = name{
        return "Hello" + theName
    }
    return nil
}

//return multiple value
func greeting5(name1:String,name2:String)->(String,String)
{
    let greeting1 = "Hello"+name1;
    let greeting2 = "Hello" + name2;
    return (greeting1,greeting2)
}
var greetings :(greeting1:String,greeting2:String) = greeting5("tonny",name2: "bob")
print(greetings.greeting1)
print(greetings.greeting2)

//parameter Name
//such as: name1，name2可以用于函数内部，name1不能用于外部，name2可以用于外部，为了让第一个参数可以用于外部，可以强制指定一个名称firstName,强制指定外部名称后，在调用函数时必须指定外部名称。
func greeting6(firstName name1:String,secondName name2:String)
{
    let greetingMessage = "Hello " + name1 + " and " + name2
    print(greetingMessage)
}
greeting6(firstName: "tonny",secondName: "bob")
//greeting6("tonny",secondName:"bob") error
//greeting6("tonny",name2:"bob") error

//function default values
func greet(name:String = "ddd")->String{
    return name
}
print(greet()) //omit argument,use default value
print(greet("toonny"))

//可变长参数
func sum(numbers:Double...)->Double{
    return numbers.reduce(0){ $0 + $1}
}
let mysum = sum(3.0,3.4,8.9)
let mysum2 = sum(3,5)

//****Mutablity of Parameters:By default,parameters are passed as constants,and you can't change in the body of the function
func greet2(var name:String = "Wapat")->String{
    name = "Hello" + name;
    return name
}
var abs = "dsese"
var ssb:String = greet2(abs)
print(abs)

//in-out parameter:
//1.can't have default values
//2.can't be passed as a constant
//3.can't be passed as a literal
//4.can't be marked as var or let
//5.can't be variadic(可变的)
func tripleit(inout value:Double){
    value *= 4
}

var value = 3.0
tripleit(&value) //use & char
print(value)

//function type is made up of the arguments and return types
func add(x:Double,y:Double)->Double{
    return x + y
}
//func type:(Double,Double)->Double
var myAdd:(Double,Double)->Double = add
var sum = myAdd(5.6,5)

//Functions as Parameters
func computer(computeFunction computeFunction:(Double,Double)->Double,x:Double,y:Double)->Double{
    return computeFunction(x,y)
}
var result = computer(computeFunction: add, x: 3, y: 5)

//Functions as Return Value
func computeFunction(type type:String)->((Double,Double)->Double){
    if(type == "+")
    {
        return add //return add function
    }else{
        //nested function,this function only call in computeFunction
        func myRand(x:Double,y:Double)->Double{
            return 42.0
        }
        return myRand
    }
}
var mathFunction = computeFunction(type: "+")
var result2 = mathFunction(3,5)


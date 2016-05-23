//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Methods!"
//methos are functions  that associated with a particular type.
//in Swift,methods can be associated with classes,structure,enum types.
//methos:instance methods and type methods

//instance methods
class Stack{
    private var stack = [Double]() //a empty double array
    
    func isEmpty()->Bool{
        return self.stack.isEmpty
    }
    
    func peek()->Double?{
        return self.stack.last  //self is optional
    }
    
    func pop()->Double?{
        let value = self.stack.last
        if nil != value{
            self.stack.removeLast()
        }
        return value
    }
    
    func push(item:Double){
        self.stack.append(item)//when argument name same as variable name,must be use self
    }
}
var stack = Stack()
print(stack.isEmpty())
stack.push(5.4)
stack.push(5)
print(stack.isEmpty())
var value = stack.peek()
stack.push(5433)
value = stack.pop()

//structure and enum methods by default don't allow modifying of the state or the value of properties.
struct SomeStruct{
    var value = 0.0
    func updateValueBy(someValue:Double){
        //value = value + someValue //don't allow modify
    }
    
    mutating func updateValueBy2(someValue:Double){
        value = value + someValue //allow modify
    }
    
    mutating func updateValueBy3(someValue:Double){
        self = SomeStruct(value:value + someValue)
    }
}
//don't allow call mutating methods for structures declare as constant,these would result in an error.
let myStruct = SomeStruct()
//myStruct.updateValueBy2(10)

enum SomeEnum{
    case value1,value2
    mutating func toggle(){
        switch self{
        case value1:
            self = value2
        case value2:
            self = value1
        }
    }
}
var myEnum = SomeEnum.value1
myEnum.toggle()

//Type Methods
class SomeClass{
    class func typeMethod(){ //type methods
        //do some thing
    }
}
struct SomeStruect{
    static func staticFunc(){
        //do some thing
    }
}
//call type method
SomeStruect.staticFunc()
SomeClass.typeMethod()


//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, generics!"

//1.generics function:To define a function that takes generic values,you create a generic type,which will be replaced by the actual type.The generic type is not limited to arguments.It can also be a return type
func equalsValue<T:Equatable>(t1:T,t2:T) -> Bool{
    return t1 == t2
}
var ar = equalsValue(3, t2: 4)
var ar2 = equalsValue(4.5, t2: 5.4)
var ar3 = equalsValue("tom", t2: "tom")

//if you want two generic types of arguments
func someFuction<T1,T2>(t1:T1,t2:T2){
    
}
/*func someFunction1<T1:SomeClass,T2:SomeProtocol>(argu1:T1,arug2:T2){
    
}*/

//2.Generic Class
struct Stack<T>{
    private var stack = [T]()
    
    func empty()->Bool{
        return stack.count == 0
    }
    
    func peek()->T?{
        return stack.last
    }
    
    mutating func pop()->T?{
        guard let value = stack.last else{
            return nil
        }
        stack.removeLast()
        return value
    }
    mutating func push(item:T){
        stack.append(item)
    }
}
//test
var intStack = Stack<Int>()
var strStack = Stack<String>()

//3.Extensions:When extending a generic type,you do not need to specify the generic type again in the extension;the original generic type is available.

//extension Stack<T>{ //error,don't need to specify generic
//}

extension Stack{
    var size:Int{
        get{
            return self.stack.count
        }
    }
    var top:T?{
        get{
            return self.stack.isEmpty ? nil : self.stack[self.size - 1]
        }
    }
}

//4.Associated Types

/*protocol SomeProtocol<T>{
    //error
}*/

protocol SomeProtocol{
    associatedtype GenericType
    func someFunction(argument:GenericType)
}
//case 0
class SomeClass : SomeProtocol{
    typealias GenericType = Int
    func someFunction(argument: GenericType) {
        //do something
    }
}
//case 1
class SomeCalss2 : SomeProtocol{
    func someFunction(argument: Int) {
        //do something
    }
}

//test2
protocol SpecialCollection{
    associatedtype SpecialCollelctionType
    
    func count()->Int
    mutating func add(item:SpecialCollelctionType)
    subscript(index:Int)->SpecialCollelctionType{ get }
}
struct NewStack<T> : SpecialCollection{
    private var stack = [T]()
    
    func empty()->Bool{
        return stack.count == 0
    }
    
    func peek()->T?{
        return stack.last
    }
    
    mutating func pop()->T?{
        let value = stack.last
        if nil != value{
            stack.removeLast()
        }
        return value
    }
    
    mutating func push(item:T){
        return stack.append(item)
    }
    
    func count()->Int{
        return self.stack.count
    }
    
    mutating func add(item:T){
        self.push(item)
    }
    
    subscript(index:Int)->T{
        return self.stack[index]
    }
}

//where:Use check type,limit generic two type
/*
func areIdentiacal<T1:SpecialCollection,T2:SpecialCollection where T1.SpecialCollection == T2.SpecialCollection,T1.SpecialCollection:Equatable>(collection:T1,collection1:T2)->Bool{
    
}*/

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Expression
 1.Primary
 2.Prefix
 3.Binary
 4.Postfix
 */

//if the error producing expression produces an error the values of the try? result is nil other wise the valid result from the expression is produced.
var myResult = try? print("4")

//if the function does not produce an error then the value of result from function is returned;if the function produces and error then there is a runtime error and may cause a crash in code.
try! print("323")

//condition?evaluate true:evaluate false

/*
 1.is,to check if the type is of a specific type
 2.as,to downcast the type to another type
 3.as?,to downcast as an optional type
 4.as!,to downcase an a forced unboxed type
 5.In Cocoa Touch frameworks always downcast to NSObject
 6.In Swift,if the class is not a subclass of another,get a compile error.
 */

/*
 1.self:
    if used within the class function,the self expression refer to the type itself,but in an instance method it refers to a specific instance of the type.
 2.super:
    super is used when referring to a superclass,if the type has a superclass.
 */

/*
 Closures and Functions
 
 1.Closures:
    *var myClosuresVariable:(parameters)->(returnType)
    *typealias MyClosureType = (String:String?)->(String)
        var myClosureVar : MyClosureType
    *myClosuresVar = { (string:string?) ->string in 
        return string ?? ""
    }
 */
{
    (a:Int,b:Int)->Int in
        return a % b
}

//the result of an optional expression is always an optional type
//expression?

class SomeClass
{
    func someFunc() -> Int {
        return 43
    }
}
var someInstance:SomeClass?
var result = someInstance?.someFunc() //result is Int?
if let unwrapped = someInstance{
    result = unwrapped.someFunc()
}

//Optional Chainning:give a list of the expression that return value of the same type,then first expression that returns a valid valid it is used.
//expression ?? expression2

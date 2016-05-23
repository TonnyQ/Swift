//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Error Handling!"

//1.representing Errors
//in Swift,to process errors,have to confrom to the ErrorType protocol.define an enum that conform to this protocol to group similar errors together.by throwing an error,use the throw keyword and then error type
enum NetworkError:ErrorType{
    case HostUnreachable
    case InvalidPermissions
    case DataMissing
}
//report error
throw NetworkError.DataMissing

//2.Handling Errors
/*
 + Propagate the error to the function callee
 + Handle the error using the do-catch block
 + Process an error as an optional value
 + Assert that errors will not happen
 %if know where there is a possibility of an error in the code,can use try keyword and catch to property catch the error after throwing.
 */

/*do{
    try expression
    statements0
}catch pattern1{
    statements1
}catch pattern1 where condition{
    statements2
}catch{
    statements3
}*/
/*
 do{
    let result = try divide(a:4.3,b:0)
 }catch{
    print(error)
 }
 */

//3.Propagting Errors
//if you do not want to or don't know how to handle errors in a function,you can propagate the error to the callee function.
func functionThatThrows() throws ->Int{
    return 0
}

//4.Optional Handling
//use try? keyword,if the function succeeds,return a valid value;if the function fails just return nil.
func divide(a:Double,b:Double) throws -> Double{
    if b == 0{
        throw NetworkError.DataMissing
    }
    return a / b
}
let result = try? divide(4, b: 4) //return a optional value
let result1 = try? divide(4,b:0)

//5.Asserting Errors
//if know for sure that the throwing function will not throw an error by checking the arguments and only calling the function will valid values,then force unbox the result using the try! keyword.but if throw an error,will get a runtime error.
let result2 = try! divide(3,b:8)
let result3 = try! divide(5, b: 0) //get a runtime error

//Cleanup Actions
//when read a file,throw an error lead to don't close file handle.can use defer keyword,The defer statement will be executed no matter how you exit the function.It could be either an error thrown or return statement,or break statement.but the defer statement don't contains transfers the control out of the defer block,means the defer block must execute all of its code.
/*
 defer{
    statement
 }
 */

/*
 when have multiple defer statments,the order of the execution of defer statements is in reverse when they are defined..
 defer{
    statement0
 }
 statement1
 defer{
    statement2
 }
 */
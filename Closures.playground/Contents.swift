//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Closures are blocks of code that perform specific tasks.Closures in Swift are similar to blocks in c and Objective-C and to lambdas in some language.

//optional
var myClosure:((arg1:Int)->(Int))?

//alias
typealias MyClosureType = (args1:Int)->(Int)
var myClosure2:MyClosureType //Equal myClosure

/*
 let myClosure = { (parameters)->returnType in
    statements
 }
 parameters:Constant,Variable,Inout,Variadic(only if last parameters),Tuple.
 */
let numbers:[Int] = [118,3232,3,3214,33]
func asending(element1:Int,element2:Int)->Bool{
    return element1 < element2
}
let sortedNumbers1 = numbers.sort(asending) //asending is specific closure

//keyword in denote the start closure block
let sortedNumbers2 = numbers.sort{(element1:Int,element2:Int)->Bool in
    return element1 < element2
}

//inferring types from context
let sortedNumbers3 = numbers.sort({ element1,element2 in
    return element1 < element2
})

//implicit returns
let sortedNumbers4 = numbers.sort({element1,element2 in element1 < element2
})

//shorthand argument names,omit the arguments list and in keyword
let sortedNumbers5 = numbers.sort({$0 < $1})

//Trailing closures,closure must be final arguments
let sortedNumbers6 = numbers.sort(){$0 < $1}

//capturing values:unknown,don't understand
func capturingValues(){
    var a:Double = 5
    print(a)
    func increment(incrementBy:Double){
        a += incrementBy //a can asses in increment,but a define after function define,a will can't asses
    }
    increment(4)
    print(a)
    increment(2)
    print(a)
}
capturingValues()




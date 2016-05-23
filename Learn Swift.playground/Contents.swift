//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground" //equals var str:String = "Hello,playground"

/*
 * mutil line comments
 */
//Editor->Show Rendered Markup
//: Mutli line rich text *comment* using __Markdown__ syntax

//in swift don't need ';'
var a = 4;var b = 4 //need ';'

//print func
print("Hello,Swift")

//: swift don't need a special entry point,such as __main__ function in __Objective-C__

/*
 Basic Type
 1. use let define a constant value,which can be assigned only once;
 2. use var define a varible whose value can change during the execution;
 3. Values are never implicitly converted from one type to another type,must prodive a conversion function;
 4. the basic type are String,Character,Int,UInt,Float,and Double in swift.
 */
var myVariable = 11
myVariable = 13
print(myVariable)

let someOtherVaribale = 14
//someOtherVaribale = 15 //error,constant don't once assigned.

var explictitDoubleValue : Double = 22; //must implicit varibale type

//type conversion
var myString = "The answer is"
let answer = 42
//let myAnswer = myString + answer //error
let myAnswer = myString + String(answer); //int convert String,create a new String in really
//or let myAnswer = "The answer is \(answer)."

/*
 Collection Type
 1. define arrays,sets,and dictionaries using '[]' syntax;
 */
var someInts:[Int] = [Int]() //create a empty int array
var myArray:[String] = [String]()
var myDict:[String:String] = [String:String]()
var mySet : Set<String> = ["object","object2"]

var favoriteFruits = ["Oranges","Bananas","Grapes"]
print(favoriteFruits[2])
var favorites = ["fav":favoriteFruits]
favorites["mis"] = ["ddd","dds"]
print(favorites)

/*
 Control flow
 1. The '()' around the condition and loop variables are optional,such as:
 if a==b or if(a==b)
 switch foo or switch(foo)
 while a < b or while(a<b)
 2. the braces around the body are required
 if a== b
 {
    print("they are equal")
 }
 */

/*
 Functions in swift are full-fledged types,can pass them as arguments and return them functions,if has a function that takes a function argument and return a function,then this function is closure.Functions are a special closure that has a name.In Objective-C closure is blocks.
 
 define format:
 func functionName(arguments) -> returnType
 {
 }
 or 
 func functionName(arguments) //no return value
 {
 }
 */

/*
 Objects 
 1. Class: use keyword class to define class objects
 class MyClass
 {
 }
 
 class MyClass : ParentClass,Protocol,AnotherProtocol
 {
 }
 
 2. Enum: use keyword enum to create enumerationtypes,enums can include methods,and must have a type enum,types can be of non-integer types
 enum MyEum : Int
 {
    case One
    case Two
    case Three,Four,Five
 }
 
 3. struct: use keyword struct to define structs.struct supports most of what classes can do.different pass arguments,struct is valuetype,but classes is referenceType
 struct MyStruct
 {
 }
 */

/*
 Generics:used when you design a class that can operate on different types of objects,which allow maximum reusablity of the code.
 
 class Node<T>
 {
    var value : T
 }
 var myNode : Node<Int>
 */



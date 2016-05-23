//: Playground - noun: a place where people can play

import UIKit

/*
 Swift provides a wide range of built-in operators and allow you to define operators for your own classes and to extend built-in classes to add new operators.
 In Swift,precedence is defined by an integer;higher values have higher precedence.built-in operators have a defined precedence,overloaded operator precedence is degined in the declaration.
 In Swift,mathematical operators have left associativity,meaning that evaluation start from the left and goes to the right.
 */

//Bitwise Shift
/*
 Rules:(Unsigned integer)
    *Existing bits are moved to the left or right by the requested number of places
    *Any bits that are moved beyond the bounds of the integer's storage are discarded
    *Zeroes are inserted in the spaces left behind after the original bits are moved to the left or right
 Rules:(signed integer)
    *signed integers reuire an extra bit to denote the + or - sign.the first bit value 0 indicates a position number and 1 a negative number.
    *shifting left is the same as for unsiged numbers.
    *shifting right is the same as for unsigned numbers,but the new signed bit is the same as the previous value to ensure the number keep its sign.
 */

//unsiged
//1.left-shift==> "<<",such as:n << m == n * 2^m
//2.right-shift=> ">>",such as:m >> m == n * 2^-m
var s = 3 << 1
var s2 = 4 >> 1

//signed
var value0:Int8 = 4  //0_0000100-> 0->+ 0000100->4
var value1:Int8 = -4 //1_1111100-> 1->- 1111100->124 124-128 = -4
value1 << 1          //1_1111000->120
value1 >> 1          //1_1111110->126 *new sign is 1
value0 << 1          //0_0001000->8
value0 >> 1          //0_0000010->2   *new sign is 0

/*
 if you are using a value that is beyond the range of values a particular type can hold,that value will cause an overflow or underflow.can use the special operators to allow underflow or overflow results to occur.
    1.&*(Overflow multiply)
    2.&/(Overflow divide)
    3.&%(overflow modulus or remainder)
    4.&+(overflow addition)
    5.&-(overflow subtraction)
 */
//let e:Int8 = 127 * 2 //get a error,value overflow
let e:Int8 = 127 &* 2  //127 * 2= 254 - 128 -128 = -2

/*
 Range:
 1. (..<) (Half-Open Range) such as:1..<10 not contains 10
 2. (...) (Closed Range) such as:1...10 contains 10
 */
for i in 1..<10{
    print(i)
}
for i in 1...10{
    print(i)
}

/*
 Cast:
 1. "is" use check whether the object can be cast to the indicated type
 2. "as" use actually cast the value
 */
class Fruit{
    
}
class Banana:Fruit{
    
}
var fu:Fruit = Banana()
if fu is Banana{
    var banans = fu as! Banana //as! forced cast
}
var anotherFu = Fruit()
if anotherFu is Banana{
    var banana = anotherFu as! Banana
}
var possibleBanana = fu as? Banana   //Banana
var notBanana = anotherFu as? Banana //nil

/*
 Comparative:
 1. === (identical)
 2. !== (Not identical)
 3. ~= (Pattern Match)
 when working with reference types,two object can sometimes point to a single instance of an object.swift equal to operator(==) checks the values of the objects.to check whether the two variables or constants point to the same instance of an object,need use the identity operator(===)
 */

/*
 ??:find a valid value and ingore other expression
 */
var variable1:String? = nil
var variable2:String? = "ds"
var value = variable1 ?? variable2  //'ds' and var1&var2 sametype

/*Overloading Operators*/
/*
 swift lets you use existing operators with custom types or additional built-in types.To overloading an existing operator,need define a func.
 1.don't create an operator unless the meaning is clear
 2.the functionality should be implemented in a separate func
 3.provide proper precedence and associativity,try matching the existing operator as closely as possible
 4.create assignment operators if necessary
 */

//create an unary operator ∑(option + w in mac)
//1.declare an operator,prefix keyword specifies the type(prefix,infix,postfix).operator keyword indicates it's an operator,{}specify precedence and associativity for infix.
prefix operator ∑ {}
//2.define the function
prefix func ∑ (array:[Double])->Double{
    return array.reduce(0, combine: {(a,b)->Double in
        return a + b
    })
}

var a:[Double] = [30.4,98.7]
let b = ∑a

//create a binary operator
infix operator * { associativity left precedence 150 }
func * (left:Double,right:Double)->Double{
    return left / right
}
let d = 200.0 * 3

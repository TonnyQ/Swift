//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//all types can be defined either as mutable or immutable.
let numberOfWheelForBicycle = 2
var numberOfPassengers = 1

//can declare multiple values on a single line.
var a = 2.0,b = 5.0,c = 3.0

/*
 Type Annotation(swift is a strong type language)
 1. swift will infer the type from the inital value
 2. specify the type of the variable explicitly
 */

/*
 Identifiers:swift is designed to use almost any character,including Unicode characters,but identifiers cannot start with numbers or Mathematical sysmbol,arrow,private-use Unicode points,Invalid Unicode point,Line- or box- drawing characters
 */
let 🐱 = "cat"
//let 3m = 3 don't allow start number

//swift provides a global function called print.the print function takes an array of objects that can be converted to a string..
//format: print(items:Any...,separator : String=" ",terminator : string="\n")
print(🐱)
print("The area of circle = \(3)")
print("hello","playground",separator:"\n",terminator:"")

/*
 Integers:
 1.swift provides integers of different sizes based on the numbers of bits.
 2.using the .min and .max functions get min and max value.
 3.define two types of whole numbers:signed or undigned.
 4.Int and UInt,the range of values for these depends on the hardware architecture.such as 32bit machines equal Int32
 */
print(Int.min,Int.max) //my machine is 64-bit
print(Int32.min,Int32.max)

/*
 Floating-Point Numbers:
 1.swift provides two floating-point types;
 2.Float is defined using 32bit of data;
 3.Double is defined usiing 63bits of data;
 */
var f:Float = 4.5
var d:Double = 4.5000000

/*
 Numeric Literals:
 1.Decimal numbers have no prefix;
 2.Binary numbers use the '0b' prefix;
 3.Octal numbers use the '0o' prefix;
 4.Hexadecimal numbers use the '0x' prefix.
 */
print(12e2) //12 * 10^2
print(0xap3) //0xa * 2^3
print(12e-2) //12 * 10^-2
//long numbers,use _ to make them easier to read
let million = 1_000_000
print(million)

/*
 Conversion:
 1.only a very few situations where a number's type can be converted automatically.
 2.for the most,must do an explicit conversion when mixing different types of numbers.
 3.By default,the compiler will create a Double for a floating type,if actually want a Float,must specify the Float type
 */
var dds:Int = 32342
var floa:Float = 453.3
//var ac:Float = dds + floa
var ab = dds + Int(floa) //create an integer from a float

/*
 Booleans:
 1.Bool type only provides "true" or "flase" values.
 2.different other language,use 0 as false and any other value for ture.
 */
var theBool = true
if(theBool == true)
{
    print("true")
}
else{
    print("false")
}

/*
 Characters:
 1.a single Unicode character.
 2.statement a Character variable must specify Character type
 3.express the character in hexadecimal using the following
    *Single-byte Unicode character \xnn
    *Double-byte Unicode character \unnnn
    *Four-byte Unicode character \Unnnnnnnn
 */
let automobile : Character = "🚗" //must a single Unicode char.
let automobiles = "🚗" //inference a string type

/*
 Strings:
 1.Strings are a sequence of character types;
 2.special character that must be specified by escaping with a backslash,following:
    *Null character \o
    *Backslash \\
    *Horizontal Tab \t
 3.String class is compatible with the Objective-C NSString class
 4.the mutablility of the string depends on how they are created.if string are created using the let keyword they are constants;if they're created using var,string are mutable.
 */

//creat an empty string
var string1 = ""
//or
var string2 = String()

//use String replace NSString
if(string1.isEmpty)
{
    print("this is an empty string")
}

//string concat
string1 = string1 + " by waqar malik"
string1 += "end..."
string1.appendContentsOf(" ,and end....")

//count characters
let animals = "🐍🐶🐱🐷🐂"
print("Numbers of characters \(animals.characters.count)")

//iterate the characters in the string
for animal in animals.characters
{
    print(animal)
}

//if two string have exactly the same characters in the same order,swift different to lowercase and uppercase.
let book1 = "tonny"
var book2 = "tonny"
if(book1 == book2)
{
    print("they are the same")
}
var book3 = "TONNY"
if(book1 == book3)
{
    print("they are the same")
}
if(book1.uppercaseString == book3)
{
    print("they are the same")
}

/*
 Collection Types:
 1.swift provides various collection types,arrays,sets,and dictionaries.
 2.arrays store multiple values of the same type in an ordered list,and the values can be repeated in the list.
 3.a set type is similar to an array type with two differences；
    *The order of the elements is not defined
    *Repeating on the elements is not allowed
 4.Dictionaries store values of the same type,but they associate each value with a unique key.The keys can't repeated but values can be.the items don't have an order.
 5.Tuples are groups of ordered values,possibly of different type
 */

//define an array type variable,all element must the same type
var array1 : Array<String>
var array2 : [String] = ["a","'","vd"]
var array3 = ["dd","ee"]

//apped element
array3.append("Guava")
array3 += ["balance"] //in really concat two array

//isEmmpty
if(array3.isEmpty)
{
    print("Array is empty.")
}

//retrieve the elements by index,the array use a zero-based index
let thirdItem = array3[2]
array3[2] = "doubi"
print(array3[2])
print(array3)
array3[0...2] = ["33","44","323","44"]//replace 0,1,2 values
print(array3)

//insert some elements
array3.insert("ddsds", atIndex: 3) //array3[3] = "ddsds"

//remove element
array3.removeAtIndex(3) //by the index
array3.removeLast() //move the last element
print(array3)

//iterate
for f in array3
{
    print(f)
}
for (index,f) in array3.enumerate()
{
    print("F at index \(index + 1) is \(f)")
}

//create arrays of a given size and a give initial value
var myFloats = [Float](count:10,repeatedValue:1.0)

//set
var set:Set<Int> = [1,2,1] //auto filter repeat element
set.insert(2) //insert same element is no effect
print(set)

//dict:must specify the key type and value type
var states:Dictionary<String,String> = ["ca":"California"]
var states2:[String:String] = ["f":"Hunan"]
var states3 = ["f":"Hunan"] //don't need specify key and value type
//access dict value of element
states3["f"] = "yueyang"
let value = states3["f"]
let oldValue = states3.updateValue("Hunan", forKey: "f") //return oldvalue
print(states3)
//if key don't exit,then will add key-value to dict
let novalue = states3.updateValue("guangzhou", forKey: "g")
print(states3)
//remove item
states3["g"] = nil
states3.removeValueForKey("g") //return this value of item
//iterate dict
for(key,value) in states3{
    print("State name = \(value),abbreviation = \(key)")
}
for abbreviation in states3.keys
{
    print("abbreviation is \(abbreviation)")
}
for name in states3.values
{
    print("state name is \(name)")
}
//if use custom object as a key,then this object must be hashable
//1.this object must conform to the hashable protocol,must implement a property called hasValue and return a Integer.
//2.this hash value don't need to be unique
//3.this object must also implement the equality(==) operator.
//4.swift built-in data types,String,Int,Double,and Bool are hashable,means can use them for keys.

//tuple
let myUnnamedTuple = ("Name",4.3,10) //support mulit type and ordered
print(myUnnamedTuple.0)
print(myUnnamedTuple.2) //index don't beyond range

let (title,dd,other) = myUnnamedTuple //named tuple
print(title)

let myNamedTuple = (title:"Name",value:5.4,other:54) //type infer
print(myNamedTuple.title)

let namedAndTypeTuple:(title:String,value:Float,other:Int) = ("name",4.5,5)
print(namedAndTypeTuple.title)

//tuple are useful when you're returning mutliple values from function.

/*
 Optionals:
 1.Any type in Swift can be declared optional by adding the '?'
 2.if a variable is optional,then it can has a valid value or nil
 */
var myInt:Int? = nil
myInt = 5 //must unbox the optional value before using it
//unbox
//1.use ! operator(forced unboxing operator) to access the actual value,but hasn't a valid value,will cause an error at runtime
var result = (myInt!) + 4
//2. using the (if let) statement
if let tmpInt = myInt{ //checking whether a variable is not nil and unboxed value
    result = tmpInt
}
//3.with "guard" statement you unbox the valid value and let the execution continue or fail and execute the guard statements
func doubleValue(value:Int?)->Int?{
    guard let validValue = value else{//use guard promise validValue in the rest function 
        print("the value is nil")
        return nil
    }
    return 2 * validValue
}
var myRes:Int? = doubleValue(myInt)
var mydd:Int? = nil
myRes = doubleValue(mydd)



//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//switch

//use tuple in switch,if the first value don't match,then the second value will ingore.
let latlon = (36,77)
switch latlon{
case (0...100,-100 ..< 100):
    print("On the equator!")
default:
    print("Not on the equator!")
}

//value binding,can value bind temp constant value.
let latlon2 = (0,77)
switch latlon2{
case (0,let lon):
    print("On the equator!")
case (let lon,let lat):
    print("One match!")
}

//string matching
let carMaker = "Porsche"
switch carMaker{
case "bmw","de","www","Porsche":
    print("German")
case "Toyota":
    print("japanese")
default:
    print("Unknown")
}

//where clause
let fraction = (20,20)
switch fraction{
case let(num,0):
    print("dividing by zero")
case let(num,den) where num % den == 0:
    print("the fraction represent a whole num \(num/den)")
case let(num,den):
    print("non whole")
}

//throw
enum MyError : ErrorType{
    case InvalidValue
}
func myFunction(value:Int?) throws -> Int{
    guard let theValue = value else{
        throw MyError.InvalidValue
    }
    return 2 * theValue
}

//labeled statements
var odds = [Int]()
oddsloop : for i in 1...20{
    switch i{
    case let a where a % 2 == 0:
        continue oddsloop
    default:
        odds.append(i)
    }
}

oddsloop1 : for i in odds{
    if i == 11 {
        break oddsloop1
    }
    print(i)
}
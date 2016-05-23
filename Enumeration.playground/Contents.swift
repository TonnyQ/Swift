//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Enumerations"

//In Swift,enumerations have gotten quite an overhaul.you can define enumeration of type,String,Character,Int,or a floating type.these also contains Double,Uint,etc.

/*
 Enumeration:
 1.Implement computed properties
 2.Instance methods
 3.Custom initalizers to provide initial values
 4.Be extended
 5.Conform to protocols
 */

//define a enumeration,default define as String type and the initial values actual string that item name.but these will can't compare the values.
enum MyEnumeration{
    
}

enum Suit{
    case Hearts
    case Spades
    case Diamonds
    case Clubs
}
print(Suit.Clubs) //Clubs
enum Suit2{
    case Hearts,Spades,Diamonds,Clubs
}

var suit = Suit.Clubs
func switch_Suit(suits:Suit){
    switch suit{
    case .Hearts:
        print("Got Hearts")
    case Suit.Diamonds:
        print("Diamonds")
    case .Spades:
        print("Spades")
    default:
        print("No match")
    }
}
switch_Suit(suit)

//associated values
enum Suit3{
    case Hearts(Int)
    case Spades(Int)
    case Diamonds(Int)
    case Clubs(Int)
}
let tenOfDiamonds = Suit3.Diamonds(10)
let aceOfDiamonds = Suit3.Diamonds(1)

switch tenOfDiamonds{
case .Diamonds:
    print("Bling")
default:
    print("Not Blig")
}

switch aceOfDiamonds{
case .Diamonds(let value): //var value
    print("\(value)")
default:
    break
}

//associated multi type
enum MyEnum2{
    case One(Int)
    case Two(String)
    case Three(Int,Int)
    case Four(Int,String)
    case Five(Int,Int,Float,Character,String)
}

let five = MyEnum2.Five(1, 4, 4.5, "d", "test")
switch five{
case .Three:
    print("ddd")
case .Five:
    print("match")
default:
    print("dsese")
}



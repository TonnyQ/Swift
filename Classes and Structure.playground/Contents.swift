//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Classes and Structure!"

/*
 Different bewteen Classes to structures:
 1.Inheritance:classes can have parent classes,structures can't
 2.Deinitializers:classes have them,structures don't
 3.Reference Counting:classes use reference counting to manage memory
 4.Runtime support for type casting
 5.Classes are passed bu reference,structures are copied when passed around
 */

class Engine{
    let maxnumber:Int = 8
    var numberOfCyclinders:Int = 4
    
    //init(){ //this is specific func,use initialize class
        //numberOfCyclinders = 7
    //}
    
    init(number:Int = 4){ //overridde init func
        self.numberOfCyclinders = number
    }
    
    //return a optional Engine,if assign a object,must un-box
    init?(number:Int,flag:Bool){
        guard number > 1 && number <= 12 else{
            self.numberOfCyclinders = 4
            return nil
        }
        self.numberOfCyclinders = number
    }
}

struct Point{
    var x = 0.0
    var y = 0.0 //type infer is double
}

var location = Point() //call a default func init()
var smallEngine = Engine()
var largeEngine = Engine(number:12)

var mEngine:Engine;
if let s = Engine(number:3,flag: true){
   mEngine = s
}

//accessing properties
print(smallEngine.numberOfCyclinders)
print(location.x)

smallEngine.numberOfCyclinders = 8
location.x = 10
location.y = 20

class AutoMobile{
    var engine = Engine()
    var numberOfWheels = 5
}
var car = AutoMobile()
car.engine.numberOfCyclinders = 6
print(car.numberOfWheels)
print(car.engine.maxnumber)

//Value Type vs Reference Type
//1.all basic types in swift are value types.
//2.Classes in swift are reference type
//3.Structure in swift are value type

//structure value passed
var anotherLoc = location
location.x = 20
print(location.x)
print(anotherLoc.x)

let myCar = car //myCar is constant point,don't point other car
car.engine.numberOfCyclinders = 10
print(myCar.engine.numberOfCyclinders)

//classes equal 
//1.identical to (===),diffeent (==),(===) use judge the same instance,(==)use judge type or value.
//2.Not identical to (!==)
if myCar === car{
    print("Both mycat and car are the same instance")
}

//choosing between classes or structure
//1.if you want to copy the object when passing it around
//2.if the properties of the object themselves are value type
//3.if the object doesn't inherit from other types
//4.if you want to expose swift type in objective-c
//5.other soulation,you can create classes for objects.

//access control
//1.properties:stored properties and computed properties
//2.Observer properties:willSet,didSet
//3.Type properties

//what is stored properties?
//1.can mutable(var) or immutable(let)
//2.can provides a default value
//3.can override these default value during the init of class

class EngineVar{
    let numberOfC:Int
    init(number:Int){
        self.numberOfC = number //not init,can override
    }
    /*func add(num:Int){
        self.numberOfC =num //let properties don't other func set
    }*/
}

//what is lazy stored properteis?
//need to wait to calculate the value of a stored properties,util the init has taken place.use lazy keyword declare.but lazy must be of var type,when they might initialize outside of the init methods.
class AutoMobie{
    lazy var engine = Engine(number:8)
    var numberOfWheels = 4
}

//what is computed properties?
//these properties don't store any value.they provides a getter and setter to provide values based on other properties.
class People{
    class Engine3 {
        var number:Int = 0{
            willSet{//called before the value is changed
                print("about to set the wheels has \(newValue)")
            }
            didSet{//called after the value is changed
                print("engine had \(oldValue)")
                print("engine now has \(self.number)")
            }
        }
        var started :Bool = false
        
        init(number:Int){
            self.number = number
        }
    }
    
    let engine :Engine3
    let number:Int
    
    var started:Bool{ //a computed properity
        get{
            return self.engine.started
        }
        set(started){
            self.engine.started = started
        }
    }
    
    init(num:Int,wheels:Int){
        engine = Engine3(number:wheels)
        self.number = num
    }
}
var p = People(num:3,wheels:4)
print(p.started)

//type properties
struct MyStruct{
    static var storeTypePorperty = "Some Vlue"
    static var computedProperty : String{
        return storeTypePorperty
    }
}

struct MyEnum{
    static var storeTypePorperty = "Some Vlue"
    static var computedProperty : String{
        return storeTypePorperty
    }
}

class MyClass{
    static var storeTypePorperty = "Some Vlue"
    static var computedProperty : String{
        return storeTypePorperty
    }
}
print(MyClass.storeTypePorperty)

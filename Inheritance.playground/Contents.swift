//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Inheriatance!"

//override:replace the implementation of a method in the parent class with a method in the child class
//base class:any class that does not inherit from a class

//1.define a base class
class Shape{
    var fillColor :UIColor
    var bounds:CGRect
    
    init(bounds:CGRect,fillColor:UIColor){
        self.bounds = bounds
        self.fillColor = fillColor
    }
    
    func draw(){
        print("I don't know how to draw this shap.")
    }
}
var shape = Shape(bounds:CGRectZero,fillColor: UIColor.redColor())
shape.draw()

//2.create a subclass;swift only allows single inheritance.
//any method that's internal or public permissions can be overridden,you just need to add override befor the define of the method.
class Circle : Shape{
    override var fillColor: UIColor{ //must specify override and var,type
        didSet{ //override property observer
            print("the new color is \(self.fillColor)")
        }
    }
    
    //override setter and getter
    override var bounds: CGRect{
        get{
            return super.bounds
        }
        set{
            super.bounds = CGRectInset(newValue, 5, 5)
        }
    }
    
    override func draw() {
        print("Drawing a circle in a bounding box \(NSStringFromCGRect(self.bounds)) and color \(self.fillColor.description)")
    }
}

/*
 What was overrode?
 1.Instance methods
 2.Type methods
 3.Instance properties
 4.Type properties
 5.Subscripts
 */
class Polygon:Shape{
    var numberOfSides:Int = 3
    override func draw() {
        if numberOfSides <= 0{
            super.draw() //access to the parent class method
        }
        else{
            print("Drawing a polygon with \(numberOfSides) sides in a bounding box \(NSStringFromCGRect(self.bounds)) and color \(self.fillColor.description)")
        }
    }
}

shape = Polygon(bounds:CGRectMake(0.0, 0.0, 30.0, 30.0),fillColor:UIColor.blueColor())
shape.draw()

//Properties
//1.For inherited properties that are read-only in the superclass,you can provide both setter and getter to make the property read-write.but if a property is read-write in the super class,you cann't make is read-only in the subclass.
//2.you cann't add property observers to inherited constant stored properties or inherited read-only conputed properties for obvious reasons.
//3.you cann't provide both an overriding setter and an overrideing property observer for the same property.

//preventing overriding
//by marking methods,properties,classes,and subclass as final:
//final func,final class func,final var,final subscript,etc.
final class MyClass2{
    
}//MyClass2 cann't be inherited

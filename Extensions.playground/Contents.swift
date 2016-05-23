//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Extensions!"
//The dynamic runtime dispatch mechanism employed by swift lets you add methods to existing classed.The swift term for these new methods is etensions.

//you can add extensions to classes,structures,protocol,and enums.since basic type such as Int are structs,you can even extend them adn add functionality.

//with extensions you can add:
//1.computed properties
//2.static computed properties
//3.instance and type methods
//4.initializers
//5.define subscripts
//6.define and use new nested types
//7.make an existing type conform to a protocol
//warnning:extension cann't override existing functionality and Extensions cannot have stored properties.

//creating an Extension 
/*
 extension ExistingType{
    //your aditions
 }
 */
/*
 extension ExistingType:Protocol1,Protocol2{
    //protocol additions
 }
 */

//extension can add computed instance and type properties to existing types.
//if extension a structure or enumeration type,and need to modify the state of object,must use the mutating keyword.
extension Int{
    mutating func doubleIt(){
        self = 2 * self
    }
}
var myInt = Int(5)
myInt.doubleIt()

//subscripts
/*
 extension Stack{
    subscript(index:Int)->Double?{
        if self.stack.count < index{
            return self.stack[index]
        }
        return nil
    }
 }
 */

//nested types
extension UIColor{
    enum ErrorKind:Int{
        case Normal,File,Api
    }
    
    class func errorColor(errorKind:ErrorKind)->UIColor?{
        var color:UIColor? = nil
        switch errorKind {
        case .Normal:
            color = UIColor.blackColor()
        default:
            color = UIColor.clearColor()
        }
        return color
    }
}
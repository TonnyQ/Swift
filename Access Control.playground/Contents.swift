//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Access Control!"

//1.Access Levels
/*
 1.access type:
 + Public access allow access between modules.
 + Internal access allow access within a given module.
 + Private access allow access only within a given file.
 
 2.access limits:
 + Can't define a public class that has a parent class that's internal or private.But can define a class that't private from a public or Internal class.
 + Can't define a public property on a class that's declared as internal or private.
 + Founction can't have a move restrictive access level than their arguments or return values.
 
 3.keyword:public,internal,private,compile default access level is internal.
 */

private class MyPrivateClass{ //explicitly private
    var myProperty = 0 //implicitly private
    
    func MyFunction(){ //implicitly private
        
    }
}

class MyInternalClass{ //Internal
    var myInternalProperty = 0 //internal
    internal var myOtherInternalProperty = 5 //internal
    private var myPrivateProperty = 6 //private
    
    func MyInternalMethod(){ //internal method
        
    }
    
    private func MyPrivateFounction(){ //private
        
    }
}

public class MyPublicClass{
    var myPublicProperty = 9 //internal
    public var myProperty = 7 //public
    internal var myInternalProperty = 8 //internal
    private var myPrivateProperty = 6 //private
    
    func MyFunc1(){
        //public
    }
    
    public func MyFunc2(){
        //public
    }
    
    internal func MyFunc3(){
        //internal
    }
    
    private func MyFunc4(){
        //private
    }
}

//SubClass:all subclasses of a parent class must have an access control level equal to or stricter than that of the parent.
public class MyOtherClass : MyPublicClass{
    public override func MyFunc3() {
        //equal
    }
    
    internal override func MyFunc4() {
        //striter
    }
}

//Class Members:Constants,properties,subscripts,and variables can't have a higher access level than the type declared in.
//if one of these entities makes use of a private type,that entity must also be marked as private.
private var myPrivateVar = MyPrivateClass()

//Functions:The access level for the function is calculated from the function's parameters and return types,using the most restrictive level.

/*
 result:One type is define with public access and other with private,so the overall access level of the tuple is private,Since the return type of the function is private,the function must be declared as private.
 
private func MyFunction()->(SomePublicType,SomePrivateType){
    //return a tuple
}
*/

//Enumaterion:The case types for enumerations get the same access level as the enumeration and can't be changed.The types used by the raw values in an enumeration must have an access level as high as the enumeration's.
enum MyEnum{
    case Left
    case Right
}
//.Left and .Right must have an access level Higher than MyEnum,and its access level is internal.

//Nested Types
//Nested types defined within a private type are automatically private,but types defined within public or internal types are always internal.
public class MyPublciClass{ //public
    class MyInnerClass{ //internal
        
    }
}

//Getters and Setters:default get the same access level as the member they belong to.
public private(set) var myPublicProperty = 9 //limit set

//Initializers:Coustom initializer access level less than or equal to the type initializing.default initializer have the same access level as the class.if the type is public ,this initializer is defined as internal.

//Type Alias:have an access level less than or equal to the type.but can maker a private or internal alias of a public type,but can't make a public alias for an internal or private type.

//Extensions:the access level of the extension default to the same level as that of the original type.

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, protocol!"
//Protocols define the interface-a blueprint of methods,properties,and other requirements for a specific task.

//define a protocol,protocol can inherit from another protocol
protocol SomeProtocol:NSObjectProtocol{
    
}

//In swift the names can't be the same on classes and protocol.
//a Type can implements a list of protocols.
/**protocol AnotherProtocol{
    
}
struct SomeStruct : SomeProtocol,AnotherProtocol{
    
}

//only inherit one class,but can implement multiple protocol
class SomeClass : ParentClass,SomeProtocol,AnotherProtocol{
    
}
 */

//properties
//1.The protocol doesn't specify that the specific property has to be stored or computed.
//2.if the property is settable,it can't be either a constant stored or gettable computed property.Only gettable properties can be used to satisfy any requirements.
//3.Property requirements are always defined as var,not let.
protocol SimpleProtocol{
    var readwriteProperty:Int{ set get}
    var readonlyProperty:Int{ get }
}

//define a type property
protocol SimpleProtocol2{
    static var typeProperty :Int{ get set}
}
struct SimpleStruct2 : SimpleProtocol,SimpleProtocol2{
    var readwriteProperty : Int
    private(set) var readonlyProperty : Int
    
    static var typeProperty: Int{
        get{
            return 0
        }
        set{
            
        }
    }
}

protocol FullName{
    var fullName:String{ get }
}
struct Person:FullName{
    var lastName:String
    var firstName:String
    var middleName:String?
    
    init(firstName:String,lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String{
        return firstName + (middleName == nil ? "" : (middleName!)) + " " + lastName
    }
}

//test
var alan = Person(firstName: "Alan",lastName: "Turing")
print(alan.fullName)
alan.middleName = "Mathison"
print(alan.fullName)

//Methods:a protocol are specific instance and type methods
//define a method in protocol,can't specify default values for params
protocol MethodProtocol{
    func instanceMethod()
    //if methods will specify the state of a structure or enum
    //mutating func instanceMethod()
    static func typeMethod()
}

//Initializers:protocol can require a specific initialzer to be implemented by a conforming class.
protocol Simple{
    init(parameter:Double)
}
class someclass:Simple{
    //if this class is marked as final,but don't need require.
    required init(parameter:Double){//must require keyword
        
    }
}

//if the subclass override a designated initializer and also implement the matching initializer requirements from a protocol,then both the required and override keyword must be used to property satisfy both requirements.

 class ParentClass{
    init(parameter:Double){
    
    }
 }
class SomeClass2:ParentClass,Simple{
    required override init(parameter:Double){
        super.init(parameter: <#T##Double#>)
    }
}

//Protocol as type
class SomeClass{
    var protocolConformingProperty:SomeProtocol
    init(someObject:SomeProtocol){
        self.protocolConformingProperty = someObject
    }
}
/*
var myClass = SomeClass(someObject:SomeStruct2(readwriteProperty:5,readonlyProperty:10))
print(myClass.protocolConformingProperty.readonlyProperty)
*/

//Conformance with Extension
extension CollectionType{
    func printAll(){
        print("\(self)")
    }
}
var myArray : Array<String> = ["a","b"]
myArray.printAll()

var myDict : Dictionary<String,String> = ["ca":"california","tx":"Texas"]
myDict.printAll()

//Protocol and Collection Types
protocol SomeProtocol4{
    func someFunction()
}
class MyObject1:SomeProtocol4{
    func someFunction() {
        print("someFunction")
    }
}
class MyObject2: SomeProtocol4 {
    func someFunction() {
        print("someFunction")
    }
}
let object1 = MyObject1()
let object2 = MyObject2()
let items:[SomeProtocol4] = [object1,object2]

//Protocol Inheritance
protocol SomeProtocol5:SomeProtocol4,SomeProtocol{
    
}
//limit protocol to be used with classes only,use class keyword.
protocol MyProtocol:class{
    
}
protocol MyProtocol2:class,NSObjectProtocol {
    
}

//Protocol Composition
func MyFunction(parameter:protocol<SomeProtocol,SomeProtocol4>){
    //parameter require confrom to all of the protocols.
}

//Protocol Conformance
//use the is or as operator to check for protocol conformance.
//is operator return true or false depending on if the object conforms to or not conforms to the protocol.
//as? operator return an object of the protocol or nil if the object does not conform to the protocol
//as! operator force the conversion of the protocol type to another type.if the object does not conform to the protocol,it will be a runtime error and program will crash.

//Optional Requirements
//if you have a protocol where not all properties or methods need to be implemented,you can mark those items with the optional keyword.
//to use the optional keyword,the protocol must be marked with @objc,which exposes your protocol to OBJective-c runtime.

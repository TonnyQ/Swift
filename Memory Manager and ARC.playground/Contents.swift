//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, ARC!"

//1.Object Life Cycle
/*
 When an object is created,you do so using one of the defined initializers,and when the object is destroyed the deinitializer is called.
 */

//2.Reference Counting
/*
 Every object has an count associated with it.when some chunk of code is interested in an object,the code increase the object's retain count,when that code is done with the object,it decrease the retain count,when the retain count goes to 0,it's destroyed and its memory is returned to the system for reuse.
 Warnning:Reference counting only applies to instance of classes,and not to structures or enumeration types.
 */

//3.Object Ownership
/*
 An object with instance varibales that point to other objects is said to own object.That's called a strong reference.It means you have a firm hold on that object,and it will not be released until you let go of that hold.
 */

//4.ARC
/*
 Automatic Reference Counting is a compile-time system that keeps track of and manages the memory an application uses.
 */
class Student{
    let name:String
    init(name:String){
        self.name = name
        print("Student \(self.name) is being initialized.")
    }
    
    deinit{
        print("Student \(self.name) is being deinitialized.")
    }
}
var student:Student? = Student(name:"tonny")
student = nil //give up the strong reference,system clean memory


//5.Stong Reference Cycles
class Automobile{
    let name:String
    init(name:String){
        self.name = name
    }
    
    var driver:Driver? = nil
    deinit{
        print("Automobile \(name) is being deinit.")
    }
}

class Driver{
    let name:String
    init(name:String){
        self.name = name
    }
    
    var automobile:Automobile? = nil
    deinit{
        print("Driver \(name) is being deinitialized.")
    }
}

var mario:Driver? = Driver(name:"Mario")
var ferrari:Automobile? = Automobile(name:"Ferrari")
//strong reference cycle
mario!.automobile = ferrari
ferrari!.driver = mario
mario = nil //mario memory dont release,because it hold ferrari
ferrari = nil //ferrari memory don't release,because it hold mario reference

//resolving strong reference cycle:weak reference and unowned reference
//1.Use a weak reference whenever it's valid for that reference to become nil at some point duing its lifetime.
//2.Use an unowned reference when you know that the reference will never be nil once it has been set during initailization.

//use weak reference limit
//1.it must be declared as a variable using the var keyword.
//2.it can't be decalared as a constant.
//3.it must be declared as optional.
//warnning:when the instance the weak reference refers to goes away,ARC will set the value of the reference to nil.
class Driver2{
    let name:String
    init(name:String){
        self.name = name
    }
    //weak reference
    weak var automobile:Automobile2? = nil //must use var and optional
    deinit{
        print("Driver \(name) is being deinit.")
    }
}
class Automobile2{
    let name:String
    init(name:String){
        self.name = name
    }
    
    var driver:Driver2? = nil //strong reference
    deinit{
        print("Automobile \(name) is being deinit.")
    }
}
//test
var vettel:Driver2? = Driver2(name:"VETTLE")
var renault:Automobile2? = Automobile2(name:"RENAULT")
vettel?.automobile = renault
renault?.driver = vettel
vettel = nil
renault = nil


/*1.when renault is nil,vettel weak reference automobile is nil
renault = nil
if let ss = vettel?.automobile{
    print(ss)
}else{
    print(false) //fasle
}
*/

/*2.when vettel is nil,renault strong referene driver isn't nil
vettel = nil
if let ss = renault?.driver {
    print(true) //true
}else{
    print(false)
}
*/


//Unowned reference don't have a strong reference to the instance they refer to.The different is that an unowned reference must always have a valid value.use unowned keyword.
//use Unowned reference limit
//1.They can't be declared as optional
//2.ARC can't set the value to nil
//warnning:if you access the value of an unowned reference after its instance has been deallocated,will get a runtime error and program will crash
class Person{
    let name:String
    init(name:String){
        self.name = name
    }
    var automobile:Automobile3? = nil
    deinit{
        print("Person \(name) is being deinit.")
    }
}

class Automobile3{
    let name:String
    
    weak var driver:Person? = nil
    unowned var owner:Person
    
    init(name:String,owner:Person){
        self.name = name
        self.owner = owner
    }
    
    deinit{
        print("Automobile \(name) is being deinit")
    }
}
var waqar:Person? = Person(name:"tonny")
var vw:Automobile3 = Automobile3(name:"test",owner: waqar!)
waqar?.automobile = vw
vw.driver = waqar

waqar = nil
if let ss = vw.driver{
    print(true)
}else{
    print(false) //false
}
//var error = vw.owner //get a runtime error,owner is deallocated

//Strong reference Cycle and Closures
//if assign a closures to a property of a class instance,and the body of that closure captures the instance.,will might lead to strong reference cycle.because closures are reference types.

class Automobile4{
    let name :String
    init(name:String,owner:Person){
        self.name = name
        self.owner = owner
    }
    //strong reference cycle,because ()->String,hold a strong reference to the instance and the instance hold a strong reference to the closure reference self in its body.
    lazy var information:()->String = {
        //even thought the closure reference self multiple times,only one strong reference is captured.
        if let driver = self.driver{
            return "Automobile \(self.name) is owned by \(self.owner) and driven by \(self.driver)"
        }else{
            return "Automobile \(self.name) is owned by \(self.owner) and driven by \(self.driver)"
        }
    }
    
    lazy var information2:()->String = {
        [unowned self] in //use unowned,because self never nil
        if let driver = self.driver{
            return "Automobile \(self.name) is owned by \(self.owner) and driven by \(self.driver)"
        }else{
            return "Automobile \(self.name) is owned by \(self.owner) and driven by \(self.driver)"
        }
    }
    
    weak var driver:Person? = nil
    unowned var owner :Person
    deinit{
        print("Automobile \(name) is being deinit.")
    }
}
var tonny:Person? = Person(name:"tonny")
var dd:Automobile4? = Automobile4(name:"test",owner: tonny!)

//dd = nil //can call deinit.

//var info =  dd?.information
//dd = nil //can't call deinit,because strong reference cycle

//To solve closures strong reference cycle.
/*
 use a closures capture list,defines the rules to use when capturing one or more reference types withins the closures.use either unowned or weak keyword,depending how the instance are defined.
 template:
 {[capture list] (arguments)-> returnType in
 }
 */
var info = dd?.information2
dd = nil //can call deinit,because a capture list
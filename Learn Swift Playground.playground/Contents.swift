//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
//str = 43 //Once the initial is set for a variable,it cannot be changed.
str = String(43) //create a new String Object

//var value; //error,swift is a strongly typed language,variable must have a type associated with it.
var value:Int;//or var value = 43

//var c = value + 43; error,value has not initialized before using it

//result view supports Objects(sturct and Classes),Strings,Images,Colors,Views,Array and Dictionaries,Point,Rects,and Size,Bezier Paths,URls(using WebView)
for i in 1...10{
    i * i
}

/*
 Custom QuickLook Plugins:
 1. use XCPlayground module,which has three functions that will allow us to display custom values and views in the Assistant Editor(XCPlayground only works for NSView- and UIView-based subviews)
 2. XCShowView,developing a custom view and would like to show the result,you can call this method to display what the view look like;such as: XCShowView(identifier:String,view:UIView)
 3. XCCaptureValue,display some values,use this function.such as:XCCaptureValue<T>(identifier:String,value:T)
 4. XCPSetExecutionShouldContinueIndefinitely,allow to execute long running asynchronous tasks.such as:XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely:Bool = default)
 */

/*Custom Playground Plguins*/
/*
 1. Create a new Xcode project
 2. Select under the iOS section Framework&Library,and select Cocoa Touch Framework,give the framework name and other information.make sure to select swift under the language.
 3. Create a new file by selecting File->New->File...make sure to select iOS->Source and then swift File.added plugin code.
 4. Add an example project that has our framework as a dependency.File->New->Target...,choose iOS->Application->Single View Application.
 5. Give it the name;Select the project and then select target.One of the optional is Build Phases.
 6. Select the Build option from the project menu or Command-B.
 7. Create a playground that wil use the framework.
 */

//
//  ViewController.swift
//  Example01
//
//  Created by 邱文武 on 16/5/24.
//  Copyright © 2016年 Tonny. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var RightSwitch: UISwitch!
    @IBOutlet weak var LeftSwitch: UISwitch!
    @IBOutlet weak var Label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //register noticfication
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidHide:", name: UIKeyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //unregister
        NSNotificationCenter.defaultCenter().removeObserver(self,name:UIKeyboardDidShowNotification,object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardDidShow(notification:NSNotification){
        NSLog("keyboard opening")
    }
    
    func keyboardDidHide(notification:NSNotification){
        NSLog("keyboard closing")
    }

    @IBAction func onClick(sender: AnyObject) {
        self.Label1.text = "Hello,Tonny!"
    }
    @IBAction func touchDown(sender: AnyObject) {
        if(self.LeftSwitch.hidden == true)
        {
            self.LeftSwitch.hidden = false
            self.RightSwitch.hidden = false
        }else{
            self.LeftSwitch.hidden = true
            self.RightSwitch.hidden = true
        }
    }
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        var slider = sender as! UISlider
        let progressAsInt = Int(slider.value)
        let newText = NSString(format: "%d",progressAsInt)
        //self.Slider
        print("The Slider Value of \(newText)")
    }
    
    @IBAction func switchValueChanged(sender: AnyObject){
        var witchSwitch = sender as! UISwitch
        var setting = witchSwitch.on
        self.LeftSwitch.setOn(setting,animated:true)
        self.RightSwitch.setOn(setting,animated:true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}


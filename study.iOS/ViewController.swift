//
//  ViewController.swift
//  study.iOS
//
//  Created by Aki Fukayama on 2015/02/10.
//  Copyright (c) 2015年 Aki Fukayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func myButton(sender: AnyObject) {
        self.myLabel.text = "Hello, new world ;D"
    }
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBAction func changeStepperValue(sender: UIStepper) {
        let num = Int(sender.value)
        self.numLabel.text = num.description
    }
  
    @IBAction func showHide(sender: UISwitch) {
        self.myLabel.hidden = !sender.on
    }
    
    @IBOutlet weak var bgColor: UIView!
    
    @IBAction func changeBgColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.bgColor.backgroundColor = UIColor.blackColor()
        case 1:
            self.bgColor.backgroundColor = UIColor.darkGrayColor()
        case 2:
            self.bgColor.backgroundColor = UIColor.grayColor()
        default:
            self.bgColor.backgroundColor = UIColor.blackColor()
            
        }
    }

    @IBOutlet weak var myCat: UIImageView!
    @IBAction func changeImageAlpha(sender: UISlider) {
        self.myCat.alpha = CGFloat(sender.value)
    }
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var tmpStr = textField.text as NSString
        tmpStr = tmpStr.stringByReplacingCharactersInRange(range, withString: string)
        
        if tmpStr == "" {
            self.myLabel.text = "Hello, world :D"
        } else {
            self.myLabel.text = tmpStr as String
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        // 改行は反映しない
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTextField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


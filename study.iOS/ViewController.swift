//
//  ViewController.swift
//  study.iOS
//
//  Created by Aki Fukayama on 2015/02/10.
//  Copyright (c) 2015年 Aki Fukayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


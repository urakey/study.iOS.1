//
//  ViewController.swift
//  study.iOS
//
//  Created by Aki Fukayama on 2015/02/10.
//  Copyright (c) 2015年 Aki Fukayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

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
            self.myLabel.text = tmpStr
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        // 改行は反映しない
        return false
    }
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    let compos = [["Sun", "Mon", "Teu", "Wed", "Thu", "Fri", "Sat"], ["09:00", "11:00", "13:00", "15:00", "17:00", "19:00", "21:00"]]
    
    // ピッカービューのコンポーネントの個数を返す
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    // 各コンポーネントの行数を返す
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]
        return compo.count
    }
    
    // 各コンポーネントの横幅を返す
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 100
        } else {
            return 120
        }
    }
    
    // 指定のコンポーネント、行の項目名を返す
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let item = compos[component][row]
        return item
    }
    
    // ドラムが回転して項目が選ばれた
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = compos[component][row]
        println("\(item)がえらばれました")
        
        let row1 = pickerView.selectedRowInComponent(0)
        let row2 = pickerView.selectedRowInComponent(1)
        let item1 = self.pickerView(pickerView, titleForRow:row1, forComponent:0)
        let item2 = self.pickerView(pickerView, titleForRow:row2, forComponent:1)
        println("現在えらばれているのは\(item1, item2)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTextField.delegate = self;
        self.myPickerView.delegate = self;
        self.myPickerView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


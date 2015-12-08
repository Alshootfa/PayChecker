//
//  ViewController.swift
//  Paychecker
//
//  Created by Alshootfa on 12/2/15.
//  Copyright © 2015 Alshootfa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let hoursWorked:[Int] = Array(10...60)
    let payRate: [Int] = Array(9...50)
    let atSymbol = "@"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    
//------------Change Statues Bar------------------------------------------------

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
        
    }
    
//------------UIPickerView------------------------------------------------
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return hoursWorked.count
        } else if component == 1 {
            return 1
        } else {
            return payRate.count
        }
    }

    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent compnoent: Int) -> NSAttributedString? {
        if compnoent == 0 {
            return NSAttributedString(string: String(hoursWorked[row]), attributes:[
                NSFontAttributeName:UIFont(name: "Times New Roman", size: 1.0)!,
                NSForegroundColorAttributeName:UIColor.whiteColor()
                ])
        } else if compnoent == 1 {
            return NSAttributedString(string: atSymbol, attributes: [
                NSFontAttributeName:UIFont(name: "Georgia", size: 24)!,
                NSForegroundColorAttributeName:UIColor.whiteColor()
                ])
        } else if compnoent == 2 {
            return NSAttributedString(string: "$\(payRate[row])", attributes: [
                NSFontAttributeName:UIFont(name: "Georgia", size: 24)!,
                NSForegroundColorAttributeName:UIColor.whiteColor()
                ])
        } else {
            return nil
        }
    }

    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    
    
    func updateLabel(){
        let hoursWorkedSelected: Int = hoursWorked[pickerView.selectedRowInComponent(0)]
        let payRateSelected: Int = payRate[pickerView.selectedRowInComponent(2)]
        total.text = "\(hoursWorkedSelected * payRateSelected)$"
    }

    
    
}


//
//  ViewController.swift
//  Tipsy
//
//  Created by Maliha Fairooz on 12/31/15.
//  Copyright © 2015 Pearsman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billamountField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var tipsyLabel: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
            tipsyLabel.center.x = self.view.frame.width + 30
            UIView.animateWithDuration(1.0, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 5.0, options: [], animations: ({
            self.tipsyLabel.center.x = self.view.frame.width / 2
                }), completion: nil)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.05, 0.10, 0.20, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var splits = [1.0, 2.0, 3.0]
        var split = splits[splitControl.selectedSegmentIndex]
        let billAmount = NSString(string: billamountField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = (billAmount * tipPercentage) / split
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func tapGesture(sender: AnyObject) {view.endEditing(true)
    }
}


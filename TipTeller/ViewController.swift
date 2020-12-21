//
//  ViewController.swift
//  TipTeller
//
//  Created by Melanie Chan on 12/18/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountInput: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var tipPercentSlider: UISlider!
    
    let tipPercentages = [0.15, 0.18, 0.20]
    
    
    var tipPercent = Double(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change font color of segment control text
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white], for: .normal)
        
                        
    }
    
    // when user taps outside bill amount text field
    @IBAction func onTap(_ sender: Any) {
        
        // close keypad
        view.endEditing(true)
    }
    
    // when slider is used, change current tip percent
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        tipPercent = Double(sender.value)
        
        calculate()
        
        // if slider has the same value as a segment control option, change segment control selection
        // set segment control selection to be slider value, if segment control has that same value
        var currentIndex = 0    // index of segment control option
        
        for percent in tipPercentages {
            if (Float(percent) >= sender.value) {
                tipControl.selectedSegmentIndex = currentIndex
                break;
            }
            currentIndex += 1
        }
        
    }
    
    
    // when user selects a tip percent from segment control
    @IBAction func calculateTip(_ sender: Any) {
        
        // get tip input
        tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        calculate()
        
        // reflect change on slider
        tipPercentSlider.setValue(Float(tipPercent), animated: true)
    }
    
    func calculate() {
        // get input bill amount
        let bill = Double(billAmountInput.text!) ?? 0
        
        // calculate tip and total
        let tip = bill * tipPercent
        let total = bill + tip

        // update view of tip and total labels
        tipPercentage.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    }
}


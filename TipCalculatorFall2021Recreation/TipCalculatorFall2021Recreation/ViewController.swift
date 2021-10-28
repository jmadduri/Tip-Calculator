//
//  ViewController.swift
//  TipCalculatorFall2021Recreation
//
//  Created by Jithin Madduri on 10/18/21.
//

import UIKit

class ViewController: UIViewController {
    let tipPercentData: [Double] = [0.10, 0.15, 0.20, 0.25]
    var tipPercent: Double = 0.10
    
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var totalBillWTipLabel: UILabel!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var splitPerPersonLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSplitTextField: UITextField!
    @IBOutlet weak var splitBillSwitch: UISwitch!
    @IBOutlet weak var splitAmountPerPersonLabel: UILabel!
    
    @IBAction func didTapCalculateButton(_ sender: Any) {
        print("Calculate Button Tapped!")
        if billAmountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            print("Invalid entry for amount text field")
            return //Similar to a break in Java
        }
        
        let billString = billAmountTextField.text!
        
        guard let billAmount = Double(billString) else {
            return
        }
        
        let tipAmount = billAmount * tipPercent
        let amountTotal = billAmount + tipAmount
        
        tipTotalLabel.text = String(format: "$%.2f", tipAmount)
        totalBillWTipLabel.text = String(format: "$%.2f", amountTotal)
        
        view.endEditing(true)
        
        print("Switch Tapped!")
        if splitBillSwitch.isOn
        {
            if numberOfPeopleSplitTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            {
                print("Invalid entry for amount text field")
                return //Similar to a break in Java
            }
            
            let splitBillString = numberOfPeopleSplitTextField.text!
            
            guard let peopleSplitBill = Double(splitBillString) else {
                return
            }
            
            let billSplit = amountTotal/peopleSplitBill;
            
            splitAmountPerPersonLabel.text = String(format: "$%.2f", billSplit)
            
            view.endEditing(true)
        }
    }
    
    @IBAction func didTapSegmentedControl(_ sender: Any) {
        tipPercent = tipPercentData[tipSegmentedControl.selectedSegmentIndex]
    }
    
    @IBAction func didTapSplitBillSwitch(_ sender: Any) {
        if splitBillSwitch.isOn
        {
            splitPerPersonLabel.isHidden = false
            splitAmountPerPersonLabel.isHidden = false
            numberOfPeopleSplitTextField.isHidden = false
        }
        else
        {
            splitPerPersonLabel.isHidden = true
            splitAmountPerPersonLabel.isHidden = true
            numberOfPeopleSplitTextField.isHidden = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitPerPersonLabel.isHidden = true
        splitAmountPerPersonLabel.isHidden = true
        numberOfPeopleSplitTextField.isHidden = true
    }


}


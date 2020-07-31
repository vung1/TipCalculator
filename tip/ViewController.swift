//
//  ViewController.swift
//  tip
//
//  Created by Victor Ung on 7/30/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var yourTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //Calculates the price each person pays
        let amountOfPeople = Int(splitLabel.text!) ?? 0
        let yourAmount = total / Double(amountOfPeople)
        
        //Sets the price each person pays
        yourTotalLabel.text = String(format: "$%.2f", yourAmount)
    }
    
    
    @IBAction func slider(_ sender: UISlider) {
        
        //Gets the value from the slider
        splitLabel.text = String(Int(sender.value))
        
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Calculates the individual price each person pays
        let amountOfPeople = Int(sender.value)
        let yourAmount = total / Double(amountOfPeople)
        
        //Update the price each person pays
        yourTotalLabel.text = String(format: "$%.2f", yourAmount)
    
    }
}


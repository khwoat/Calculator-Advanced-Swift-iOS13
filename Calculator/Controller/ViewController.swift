//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishTypingNumber: Bool = true
    
    /// Getter and Setter
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculatorLogic = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishTypingNumber = true
        
        calculatorLogic.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle,
            let calculatedValue = calculatorLogic.calculate(symbol: calcMethod) {
            displayValue = calculatedValue
        }
    
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            if isFinishTypingNumber {
                displayLabel.text = numberValue
                isFinishTypingNumber = false
            } else {
                if numberValue == "." && String(displayLabel.text!).contains(".") {
                    return
                }
                
                displayLabel.text = displayLabel.text! + numberValue
//                let newValue = Double("\(displayLabel.text!.replacingOccurrences(of: ",", with: ""))\(numberText)") ?? 0.0
// 
//                let formatter = NumberFormatter()
//                formatter.numberStyle = .decimal
//                if let formattedValue = formatter.string(from: newValue as NSNumber) {
//                    displayLabel.text = formattedValue
//                }
            }
        }
    
    }

}


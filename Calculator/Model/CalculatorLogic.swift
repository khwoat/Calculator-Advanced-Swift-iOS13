//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by IT-HW05011-00224 on 29/2/2567 BE.
//  Copyright © 2567 BE London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    /// Tuple
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    /// Calculate from the passing symbol
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performCalculation(n2: n)
            default: intermediateCalculation = (n, symbol)
            }
        }
        
        return nil
    }
    
    /// Perform calculation when "=" sign is pressed
    func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default: fatalError("Given Operation does not exist.")
            }
        }
        
        return nil
    }
}

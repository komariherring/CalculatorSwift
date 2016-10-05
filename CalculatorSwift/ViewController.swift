//
//  ViewController.swift
//  CalculatorSwift
//
//  Created by Komari Herring on 9/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var operation = 0
    
    var displayNumber: Double = 0.0
    
    var resultNumber: Double = 0.0
    
    var isDecimal = false
    
    @IBOutlet var result: UILabel!
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            isDecimal = false
            resultNumber = 0
            result.adjustsFontSizeToFitWidth = true
        }
        
        override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        
        func setResultWithNumber(_ theNumber: Int)
        {
            if !isDecimal
            {
                displayNumber *= 10
                displayNumber += Double(theNumber)
                result.text = String(format: "%.0f", displayNumber)
            }
            else
            {
                result.text = result.text?.appending("\(theNumber)")
            }
            displayNumber = Double(CFloat(result.text!)!)
        }
        
        func operation(withNumber theNumber: Int)
        {
            isDecimal = false
            if resultNumber == 0 {
                resultNumber = displayNumber
            }
            else {
                result.text = String(format: "%.2f", resultNumber)
                switch operation {
                case 1:
                    resultNumber += displayNumber
                case 2:
                    resultNumber -= displayNumber
                case 3:
                    resultNumber *= displayNumber
                case 4:
                    resultNumber /= displayNumber
                default:
                    break
                }
            }
            operation = theNumber
            displayNumber = 0
        }
        
        @IBAction func zeroTapped(_ sender: Any)
        {
            self.setResultWithNumber(0)
        }
        
        @IBAction func decimalTapped(_ sender: Any)
        {
            isDecimal = true
            let range = (result.text! as NSString).range(of: ".")
            if range.location == NSNotFound
            {
                result.text = result.text?.appending(".")
            }
        }
        
        @IBAction func oneTapped(_ sender: Any)
        {
            self.setResultWithNumber(1)
        }
        
        @IBAction func twoTapped(_ sender: Any)
        {
            self.setResultWithNumber(2)
        }
        
        @IBAction func threeTapped(_ sender: Any)
        {
            self.setResultWithNumber(3)
        }
        
        @IBAction func fourTapped(_ sender: Any)
        {
            self.setResultWithNumber(4)
        }
        
        @IBAction func fiveTapped(_ sender: Any)
        {
            self.setResultWithNumber(5)
        }
        
        @IBAction func sixTapped(_ sender: Any)
        {
            self.setResultWithNumber(6)
        }
        
        @IBAction func sevenTapped(_ sender: Any)
        {
            self.setResultWithNumber(7)
        }
        
        @IBAction func eightTapped(_ sender: Any)
        {
            self.setResultWithNumber(8)
        }
        
        @IBAction func nineTapped(_ sender: Any)
        {
            self.setResultWithNumber(9)
        }
        
        @IBAction func acTapped(_ sender: Any)
        {
            operation = 0
            resultNumber = 0
            displayNumber = 0
            isDecimal = false
            result.text = "\(0)"
        }
        
        @IBAction func plusMinusTapped(_ sender: Any)
        {
            displayNumber = 0 - displayNumber
            result.text = String(format: "%.2f", displayNumber)
            result.text = String(format: "%.0f", displayNumber)
        }
        
        @IBAction func percentTapped(_ sender: Any)
        {
            
        }
        
        @IBAction func divideTapped(_ sender: Any)
        {
            if resultNumber != 0 {
                self.operation(withNumber: operation)
                result.text = String(format: "%.2f", resultNumber)
                displayNumber = Double(CFloat(result.text!)!)
                resultNumber = 0
            }
            self.operation(withNumber: 4)
        }
        
        @IBAction func multiplyTapped(_ sender: Any)
        {
            if resultNumber != 0
            {
                self.operation(withNumber: operation)
                result.text = String(format: "%.2f", resultNumber)
                displayNumber = Double(CFloat(result.text!)!)
                resultNumber = 0
            }
            self.operation(withNumber: 3)
        }
        
        @IBAction func subtractTapped(_ sender: Any)
        {
            if resultNumber != 0
            {
                self.operation(withNumber: operation)
                result.text = String(format: "%.2f", resultNumber)
                displayNumber = Double(CFloat(result.text!)!)
                resultNumber = 0
            }
            self.operation(withNumber: 2)
 
        }
        
        @IBAction func addTapped(_ sender: Any)
        {
            if resultNumber != 0
            {
                self.operation(withNumber: operation)
                result.text = String(format: "%.2f", resultNumber)
                displayNumber = Double(CFloat(result.text!)!)
                resultNumber = 0
            }
            self.operation(withNumber: 1)

        }
        
        @IBAction func equalSignTapped(_ sender: Any)
        {
            self.operation(withNumber: operation)
            result.text = String(format: "%.2f", resultNumber)
            displayNumber = Double(CFloat(result.text!)!)
            resultNumber = 0
        }
    }
 




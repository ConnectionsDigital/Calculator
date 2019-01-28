//
//  ViewController.swift
//  Calculator
//
//  Created by Kenneth W Jackson on 12/8/18.
//  Copyright © 2018 Connections Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultsLabel.text = ""
        
    }

    @IBAction func numberPressed(_ sender: Any) {
        // Write number string to screen
        
        let tag = (sender as! UIButton).tag
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            resultsLabel.text = String(tag-1)
            numberOnScreen = Double(resultsLabel.text!)!
        } else {
            resultsLabel.text = resultsLabel.text! + String(tag - 1)
            numberOnScreen = Double(resultsLabel.text!)!
        }

        
    }
    
    @IBAction func operatorPressed(_ sender: Any) {
        
        // Implement operators
        let tag = (sender as! UIButton).tag
        
        // Clear button
        if tag == 16 {
            resultsLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
        // Addition operator
        if tag == 11 {
            isPerformingOperation = true
            previousNumber = Double(resultsLabel.text!)!
            resultsLabel.text = "÷"
            operation = tag
        } else if tag == 12 {
            isPerformingOperation = true
            previousNumber = Double(resultsLabel.text!)!
            resultsLabel.text = "X"
            operation = tag
        } else if tag == 13 {
            isPerformingOperation = true
            previousNumber = Double(resultsLabel.text!)!
            resultsLabel.text = "-"
            operation = tag
        } else if tag == 14 {
            isPerformingOperation = true
            previousNumber = Double(resultsLabel.text!)!
            resultsLabel.text = "+"
            operation = tag
        } else if tag == 15 {
           
            if operation == 11 {
                resultsLabel.text = String(previousNumber / numberOnScreen)
                
            } else if operation == 12 {
                resultsLabel.text = String(previousNumber * numberOnScreen)
                
            } else if operation == 13 {
                resultsLabel.text = String(previousNumber - numberOnScreen)
                
            } else if operation == 14 {
                resultsLabel.text = String(previousNumber + numberOnScreen)
            }
        }
    }
}


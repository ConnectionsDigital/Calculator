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
        
        // Update numbe on screen
        
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
        
        // Clear button (16)
        if tag == 16 {
            resultsLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
        // Perform math operations
        // Assign operators to tag +(14) -(13) x(12) /(11)
        if (tag == 11 || tag == 12 || tag == 13 || tag == 14) {
            operation = tag
            isPerformingOperation = true
            previousNumber = Double(resultsLabel.text!)!
        }
        
       // Operator =(15)
        else if tag == 15 {
    
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


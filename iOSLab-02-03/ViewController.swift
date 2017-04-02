//
//  ViewController.swift
//  iOSLab-02-03
//
//  Created by Tomasz Jaeschke on 02.04.2017.
//  Copyright © 2017 Tomasz Jaeschke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        case Clear = "Clear"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outputLbl.text = "0"
    }
 
    @IBAction func numberPressed(_ sender: UIButton) {
        runningNumber += "\(sender.currentTitle!)"
        print(sender.currentTitle!)
        outputLbl.text = runningNumber
    }
    
    
    @IBAction func onAddPresed(_ sender: Any) {
        processOperation(operation: .Add)
    }
    @IBAction func onSubPressed(_ sender: Any) {
        processOperation(operation: .Subtract)
    }
    @IBAction func onDivPressed(_ sender: Any) {
        processOperation(operation: .Divide)
    }
    @IBAction func onEqualPressed(_ sender: Any) {
        processOperation(operation: currentOperation)
    }
    @IBAction func onMultiPressed(_ sender: Any) {
        processOperation(operation: .Multiply)
    }
    @IBAction func onClearPressed(_ sender: Any) {
        processOperation(operation: .Clear)
        outputLbl.text = "0"
    }
    
    
    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.Clear {
                    result = "0"
                    runningNumber = "0"
                    rightValStr = "0"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            
            currentOperation = operation
        } else {
            
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}


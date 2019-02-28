//
//  ViewController.swift
//  Calculator
//
//  Created by Anton Ozeryanskyy on 2/20/19.
//  Copyright © 2019 Anton Ozeryanskyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    var firstNumber: Float = 0
    var secondNumber: Float = 0
    var fullNumber: Float = 0
    var operatorValue: String = ""
    var isFirst: Bool = true
    var newOperation: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetSettings() {
        firstNumber = 0
        secondNumber = 0
        fullNumber = 0
        operatorValue = ""
        isFirst = true
        newOperation = true
    }
    
    func format (oldString: String) -> String {
        let isInt = fullNumber == Float(Int(fullNumber))
        guard !isInt else {
            let intNumber = Int(fullNumber)
            return String(intNumber)
        }
        guard oldString.count > 10 else {
            return oldString
        }
        let index = oldString.index(oldString.startIndex, offsetBy: 9)
        return String(oldString[...index])
    }
    
    @IBAction func pressNumber(_ sender: UIButton) {
        if newOperation {
            result.text = ""
            newOperation = false
        }
        let number: String
        if sender.tag == 10 {
            number = "."
        } else {
            number = String(sender.tag)
        }
        guard result.text!.count < 10 else { return }
        result.text! += number
        if isFirst {
            firstNumber = Float(result.text!) ?? 0
        } else {
            secondNumber = Float(result.text!) ?? 0
        }
        
    }
    @IBAction func clear(_ sender: UIButton) {
        result.text = ""
        resetSettings()
    }
    @IBAction func functionalButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 11:
            result.text = ""
            operatorValue = "+"
            isFirst = false
        case 12:
            result.text = ""
            operatorValue = "-"
            isFirst = false
        case 13:
            result.text = ""
            operatorValue = "*"
            isFirst = false
        case 14:
            result.text = ""
            operatorValue = "/"
            isFirst = false
        case 15:
            switch operatorValue {
            case "+":
                fullNumber = firstNumber + secondNumber
                result.text = format(oldString: String(fullNumber))
                resetSettings()
            case "-":
                fullNumber = firstNumber - secondNumber
                result.text = format(oldString: String(fullNumber))
                resetSettings()
            case "*":
                fullNumber = firstNumber * secondNumber
                result.text = format(oldString: String(fullNumber))
                resetSettings()
            case "/":
                fullNumber = firstNumber / secondNumber
                result.text = format(oldString: String(fullNumber))
                resetSettings()
            default:
                return
            }
        default:
            return
        }
    }
}


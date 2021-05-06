//
//  ViewController.swift
//  CalC
//
//  Created by SHUBHAM ASTHANA on 06/05/21.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var calcAns: UILabel!
    
    private var calculator = CalculatorLogic()
    private var isTypingFinish = true
    private var displayValue: Double {
        get{
            guard let number = Double(calcAns.text!) else{
                fatalError("Cannot convert display Label to Double." )
            }
            return number
        }
        set{
            calcAns.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func operationButtonPressed(_ sender: UIButton) {
        isTypingFinish = true
        
        if let operation = sender.currentTitle {
            
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: operation) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isTypingFinish {
                calcAns.text = numValue
                isTypingFinish = false
            }else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == Double(displayValue)
                    if !isInt {
                        return
                    }
                }
                calcAns.text = calcAns.text! + numValue
            }
        }
    }
    
}

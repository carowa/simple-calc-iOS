//  August Carow
//  ViewController.swift
//  calculator
//
//  Created by August Carow on 1/31/18.
//  Copyright © 2018 August Carow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNum: Double = 0
    var performingMath: Bool = false
    var operation: Int = 0
    var almostDone: Bool = true
    var numberSeq: [Double] = []
    var count: Int = 1
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else if almostDone {
            label.text = String(sender.tag-1)
            almostDone = false
        } else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNum = Double(label.text!)!
            if sender.tag == 12 { //Divide
                label.text = "/"
            } else if sender.tag == 13 { //Multiply
                label.text = "*"
            } else if sender.tag == 14 { //Minus
                label.text = "-"
            } else if sender.tag == 15 { //Plus
                label.text = "+"
            } else if sender.tag == 17 { //mod
                label.text = "%"
            } else if sender.tag == 19 {
                label.text = "count"
            }
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 16 { //Equals
            almostDone = true
            if operation == 12 { //Divide
                label.text = String(previousNum / numberOnScreen)
            } else if operation == 13 { //Multiply
                label.text = String(previousNum * numberOnScreen)
            } else if operation == 14 { //Minus
                label.text = String(previousNum - numberOnScreen)
            } else if operation == 15 { //Plus
                label.text = String(previousNum + numberOnScreen)
            } else if operation == 17 { //mod
                label.text = String(previousNum - ((previousNum / numberOnScreen) * numberOnScreen))
            } else if operation == 19 {
                label.text = String(count)
            }
        } else if sender.tag == 11 {
            label.text = nil
            previousNum = 0
            numberOnScreen = 0
            operation = 0
            performingMath = false
            count = 1
        }
    }
    
    @IBAction func count(_ sender: UIButton) {
        count = count + 1
        operation = sender.tag
        performingMath = true
    }
    
    @IBAction func fact(_ sender: UIButton) {
    }
    
    @IBAction func average(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


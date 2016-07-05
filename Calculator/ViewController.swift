//
//  ViewController.swift
//  Calculator
//
//  Created by Jerel Miller on 7/4/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var display: UILabel!

  var userIsInTheMiddleOfTyping = false

  var displayValue: Double {
    get {
      return Double(display.text!)!
    }

    set {
      display.text = String(newValue)
    }
  }

  @IBAction func touchDigit(sender: UIButton) {
    let digit = sender.currentTitle!

    if userIsInTheMiddleOfTyping {
      let textCurrentlyInDisplay = display.text!
      display.text = textCurrentlyInDisplay + digit
    } else {
      display.text = digit
    }

    userIsInTheMiddleOfTyping = true
  }

  @IBAction func performOperation(sender: UIButton) {
    userIsInTheMiddleOfTyping = false

    if let mathematicalOperation = sender.currentTitle {
      if mathematicalOperation == "π" {
        displayValue = M_PI
      } else if mathematicalOperation == "√" {
        displayValue = sqrt(displayValue)
      }
    }
  }
}
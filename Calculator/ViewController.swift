//
//  ViewController.swift
//  Calculator
//
//  Created by Jerel Miller on 7/4/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet private weak var display: UILabel!

  private var userIsInTheMiddleOfTyping = false

  private var displayValue: Double {
    get {
      return Double(display.text!)!
    }

    set {
      display.text = String(newValue)
    }
  }

  private var brain = CalculatorBrain()

  @IBAction private func touchDigit(sender: UIButton) {
    let digit = sender.currentTitle!

    if userIsInTheMiddleOfTyping {
      let textCurrentlyInDisplay = display.text!
      display.text = textCurrentlyInDisplay + digit
    } else {
      display.text = digit
    }

    userIsInTheMiddleOfTyping = true
  }

  @IBAction private func performOperation(sender: UIButton) {
    if userIsInTheMiddleOfTyping {
      brain.setOperand(displayValue)
      userIsInTheMiddleOfTyping = false
    }

    if let symbol = sender.currentTitle {
      brain.performOperation(symbol)
    }

    displayValue = brain.result
  }
}
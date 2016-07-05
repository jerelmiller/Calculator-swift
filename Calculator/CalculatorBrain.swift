//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jerel Miller on 7/4/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import Foundation

class CalculatorBrain {
  private var accumulator = 0.0

  var result: Double {
    get {
      return accumulator
    }
  }

  func setOperand(operand: Double) {
    accumulator = operand
  }

  func performOperation(symbol: String) {
    switch symbol {
      case "π": accumulator = M_PI
      case "√": accumulator = sqrt(accumulator)
      default: break
    }
  }
}
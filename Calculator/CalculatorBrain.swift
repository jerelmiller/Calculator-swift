//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jerel Miller on 7/4/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import Foundation

class CalculatorBrain {
  enum Operation {
    case Constant(Double)
    case UnaryOperation(Double -> Double)
    case BinaryOperation((Double, Double) -> Double)
    case Equals
  }

  private struct PendingBinaryOperationInfo {
    var binaryFunction: (Double, Double) -> Double
    var firstOperand: Double
  }

  private var accumulator = 0.0

  private var pending: PendingBinaryOperationInfo?

  private let operations: Dictionary<String, Operation> = [
    "π": Operation.Constant(M_PI),
    "e": Operation.Constant(M_E),
    "√": Operation.UnaryOperation(sqrt),
    "cos": Operation.UnaryOperation(cos),
    "×": Operation.BinaryOperation({ $0 * $1 }),
    "÷": Operation.BinaryOperation({ $0 / $1 }),
    "+": Operation.BinaryOperation({ $0 + $1 }),
    "−": Operation.BinaryOperation({ $0 - $1 }),
    "=": Operation.Equals
  ]

  var result: Double {
    get {
      return accumulator
    }
  }

  func setOperand(operand: Double) {
    accumulator = operand
  }

  func performOperation(symbol: String) {
    if let operation = operations[symbol] {
      switch operation {
      case .Constant(let value):
        accumulator = value
      case .UnaryOperation(let function):
        accumulator = function(accumulator)
      case .BinaryOperation(let function):
        pending = PendingBinaryOperationInfo(
          binaryFunction: function,
          firstOperand: accumulator
        )
      case .Equals:
        executePendingBinaryOperation()
      }
    }
  }

  private func executePendingBinaryOperation() {
    if pending != nil {
      accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
    }
  }
}
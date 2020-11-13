//
//  Backend.swift
//  R3chn3r
//
//  Created by Dietrich Poensgen on 12.11.20.
//

import Foundation

struct Backend {
    private var ergebnis: Double?
    
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
        case binary((Double,Double) -> Double)
        case equals
      }
    
    private var operators: Dictionary<String,Operation> = ["*" : Operation.binary({ $0 * $1 }), "/" : Operation.binary({ $0 / $1 }), "+" : Operation.binary({ $0 + $1 }), "−" : Operation.binary({ $0 - $1 })]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operators[symbol] {
          switch operation {
          case .constant(let value):
            ergebnis = value
          case .unary(let f):
            if ergebnis != nil {
              ergebnis = f(ergebnis!)
            }
          case .binary(let f):
            if ergebnis != nil {
              pendingBinaryOperation = PendingBinaryOperation(function: f, firstOperand: ergebnis!)
              ergebnis = nil
            }
          case .equals:
            performPendingBinaryOperation()
          }
        } else {
          print("wrong operator")
        }
      }
    
    mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && ergebnis != nil {
          ergebnis = pendingBinaryOperation!.perform(with: ergebnis!)
          pendingBinaryOperation = nil
        }
      }
      
      private var pendingBinaryOperation: PendingBinaryOperation?
      
      private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
          return function(firstOperand, secondOperand)
        }
      }
      
      mutating func setOperand(_ operand: Double) {
        ergebnis = operand
      }

    
    var endergebnis: Double? {
        get {
          return ergebnis
        }
      }
}

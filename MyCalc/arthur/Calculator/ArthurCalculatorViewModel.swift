//
//  ArthurCalculatorViewModel.swift
//  MyCalc
//
//  Created by 민쓰 on 16/04/2020.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation

/// Operation 종류 지정
private enum Operation {
    // 초기화
    case clear
    // 단항 연산
    case unary((Double) -> Double)
    // 이항 연산
    case binary((Double,Double) -> Double)
    // ..equal
    case equal
}

struct ArthurCalcuatorViewModel {
    public var result: Double? {
        didSet {
            // 모든 연산이 끝나고 나서, 이어서 계속 연산 가능하도록 결과를 피연산자에 저장
            if result != nil {
                secondOperand = result
            }
        }
    }
    /// 피연산자
    private var secondOperand: Double?
    /// 연산자
    private var pendingOperation: PendingBinaryOperation?
    
    /// 피연산자와 연산자 임시 저장용
    private struct PendingBinaryOperation {
        let firstOperand: Double
        let operation: (Double, Double) -> Double
        
        func perform(with secoundOperand: Double) -> Double {
            return operation(firstOperand,secoundOperand)
        }
    }
    
    /// 버튼명에 따라 알맞은 오페레이션 동작 매핑
    private var operations: [String: Operation] = [
        "AC":   .clear,
        "+/-" : .unary({$0 * -1}),
        "%" :   .unary({$0 / 100}),
        "+" :   .binary( + ),
        "−" :   .binary( - ),
        "×" :   .binary( * ),
        "/" :   .binary( / ),
        "=" :   .equal,
    ]
    
    /// 피연산자 지정
    mutating func setOperand(_ operand: Double) {
        self.secondOperand = operand
        result = operand
    }
    
    /// 계산 수행 로직
    /// - clear: 초기화
    /// - unarr: 단항연산
    /// - binary: 이항연산
    /// - eqaul: 결과 수행
    ///
    mutating func performOperation(_ symbol: String) {
        // 매칭되는 오퍼레이션이 있는지 구분
        guard let operation = operations[symbol] else {
            result = 0
            pendingOperation = nil
            return
        }
        
        switch operation {
        /// 초기화
        case .clear:
            result = 0
            pendingOperation = nil
        /// 단항연산
        case .unary(let function):
            if secondOperand != nil {
                result = function(secondOperand!)
            }
        /// 이항연산
        case .binary(let function):
            // 이항 연산 인 경우, 먼저 첫 번째 피연산자와 연산자를 기록하십시오.
            if secondOperand != nil {
                pendingOperation = PendingBinaryOperation(firstOperand: secondOperand!, operation: function)
                result = nil
            }
        /// 결과 수행
        case .equal:
            if pendingOperation != nil && secondOperand != nil {
                result = pendingOperation?.perform(with: secondOperand!)
            }
        }
    }
}

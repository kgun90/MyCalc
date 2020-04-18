//
//  ArthurViewController.swift
//  MyCalc
//
//  Created by 민쓰 on 04/03/2020.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation
import UIKit

class ArthurViewController: UIViewController {

    /// 텍스트가 노출되는 영역
    @IBOutlet weak var displayLabel: UILabel!
    
    private var viewModel = ArthurCalcuatorViewModel()
    
    /// 타이핑인지 여부
    private var userIsInTyping: Bool = false
    private var displayValue: Double {
        get {
            guard let doubleValue = Double(displayLabel.text ?? "") else {
                return 0
            }
            return doubleValue
        }
        set {
            displayLabel.text = String(Int(newValue))
            
            // TODO: - 소수점 처리 우짜하지
            if Double(Int(newValue)) == newValue {
                displayLabel.text = String(Int(newValue))
            }else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
}

// MARK: - UserAction Event
extension ArthurViewController {
    
    /// 숫자 버튼을 터치한 경우 실행
    @IBAction func toupUpInsideDigitButton(_ sender: UIButton) {
        
        guard let digit = sender.currentTitle,
              let displayedText = displayLabel.text
        else {
            return
        }
    
        if userIsInTyping {
             // '0' 입력하는 케이스 처리
            if digit == "0" && displayedText == "0" {
                displayLabel.text = "0"
            }  else {
                // 앞에 0이외의 숫자가 입력되어 있으면 이어서 붙힘
                displayLabel.text = displayedText + digit
            }
            return
        }
       
        if digit == "." {
            displayLabel.text = "0."
        }else {
            displayLabel.text = digit
        }
        userIsInTyping = true
    }
    
    /// 오퍼레이션을 터치한 경우 실행
    /// 1. 피연산자 설정
    /// 2. 계산 수행
    /// 3.`DisplayLabel`에 결과 노출
    @IBAction func toupUpInsideOperationButton(_ sender: UIButton) {
        guard let operationTitle = sender.currentTitle else { return }
        
        // 타이핑 중인 경우
        if userIsInTyping {
            // 1. 피연산자 설정
            viewModel.setOperand(displayValue)
            userIsInTyping = false
        }
        
        // 2. 계산 수행
        viewModel.performOperation(operationTitle)
        
        // 3. DisplayLabel에 결과 노출
        if let result = viewModel.result {
            displayValue = result
        }
    }
    
}

class ArthurCircleButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = min(self.bounds.width, self.bounds.height)/2
    }
}

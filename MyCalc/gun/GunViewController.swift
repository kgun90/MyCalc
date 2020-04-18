//
//  ViewController.swift
//  MyCalc
//
//  Created by Geon Kang on 2020/02/12.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class GunViewController: UIViewController {

    @IBOutlet weak var calcResult: UILabel!
    @IBOutlet var numBtn: [UIButton]!
    @IBOutlet weak var clearBtn: UIButton!
    
    var labelNum : String? = nil            // label에 출력 될 값을 최초 nil로 초기화 함
    var operationSign : String? = nil       // 연산기호 최초 nil로 초기화
    
    var firstNum : Int = 0                  // 연산 할 첫번째 숫자
    var secondNum : Int = 0                 // 연산 할 두번째 숫자
    
    var numDisplay : String = "0"           // 현재 표시되고 있는 숫자
    var numReset : Bool = true             // 숫자 초기화, AC/C 버튼 전환

    override func viewDidLoad() {
        super.viewDidLoad()
        calcResult.text = "0"
       
    }
    override func viewDidLayoutSubviews() {
         for btn in numBtn{
                   btn.layer.cornerRadius = btn.bounds.height / 2
               }
    }
    @IBAction func numBtnClicked(_ sender: UIButton) {
        if labelNum == nil {
            labelNum = (sender.titleLabel?.text)!
        } else if Int(labelNum!)!>0{
             labelNum? += (sender.titleLabel?.text)!
        }
        numReset = false
        clearBtnChange()
        calcResult.text = labelNum
    }
    // 숫자버튼 입력시 수행하는 함수 현재 labelNum 상태를 판단, nil일때 입력된 숫자로 변환하고 아닐때는 현재 상태에서 추가적으로 뒤에 붙인다.
    // 동시에 numReset 상태를 false로 전환하여 AC/C버튼 상태를 변환 하도록 한다
    // labelNum에 저장된 숫자는 calcResult.text 를 통하여 바로 출력한다.
    
    
    @IBAction func operationBtnClicked(_ sender: UIButton) {
        if labelNum != nil {
            Operation()
            operationSign = sender.titleLabel!.text!
            labelNum = nil
            if sender.titleLabel!.text! == "="{
                calcResult.text = String(firstNum)
            }
            if sender.titleLabel!.text! == "%"{
                calcResult.text = String(0.01*Double(firstNum))
            }

        }else {
            operationSign = sender.titleLabel!.text!
        }
        if sender.titleLabel!.text! == "+/-" && firstNum != 0{
            firstNum = -firstNum
            calcResult.text = String(firstNum)
            print(calcResult.text)
        }
    }
    // 연산기호 입력시 수행하는 함수 labelNum상태가 nil이 아님을 확인하여 Operation함수를 호출하여 일단 연산 할 변수에 삽입한다.
    // 입력받은 연산기호를 operationSign에 부여하고, labelNum을 nil로 만들어 연산기호 이후로 숫자를 입력받기위해 초기화 한다.
    // "=" 기호를 입력할 경우 현재 첫번째 값으로 입력된 변수(결과가 부여됨)를 출력하도록 한다.
    // labelNum이 nil일때는 연산기호만 부여한다.
    
    func Operation(){
        if operationSign == nil {
            firstNum = Int(labelNum!)!
        }else {
            secondNum = Int(labelNum!)!
            switch operationSign {
            case "+":
                firstNum += secondNum
            case "-":
                firstNum -= secondNum
            case "×":
                firstNum *= secondNum
            case "÷":
                firstNum /= secondNum
            default:
                print ("Error")
            }
            calcResult.text = String(firstNum)
        }
    }
   
    
    @IBAction func clearBtn(_ sender: Any) {
        calcResult.text = "0"
        numDisplay = ""
        numReset = true
        
        labelNum = nil
        firstNum = 0
        secondNum = 0
        operationSign = nil
        
        clearBtnChange()
    }
    func clearBtnChange(){
        if numReset {
            clearBtn.setTitle("AC", for: .normal)
        }else {
            clearBtn.setTitle("C", for: .normal)
        }
    } // 숫자 입력시 AC->C 텍스트 전환, = 입력시 C->AC 전환
    
    
}


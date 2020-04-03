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
    var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcResult.text = "0"
    }
    
    var numDisplay: String = "0"
    var numbers: [Int] = []
    var signs = 1
    var tmp = 0
    
    @IBAction func btnClicked(_ sender: UIButton) {
        if calcResult.text == "0"{
            numDisplay = (sender.titleLabel?.text)!

        }else {
            numDisplay += (sender.titleLabel?.text)!
        }
        calcResult.text = numDisplay
    }
    
    func calculate(){
        numbers.append(Int(numDisplay)!)
        switch signs {
        case 1:
            tmp += numbers.last!
        case 2:
            tmp -= numbers.last!
        case 3:
            tmp /= numbers.last!
        case 4:
            tmp *= numbers.last!
        default:
            print("Wrong")
        }
        calcResult.text = String(tmp)
                
    }
    
    @IBAction func btnOperation(_ sender: UIButton) {
        
        if numDisplay == ""{
            
        }else {
            switch (sender.titleLabel?.text)! {
            case "+":
                if numbers.isEmpty {
                    numbers.append(Int(numDisplay)!)
                    tmp = numbers.last!
                }else {
                    calculate()
                }
                signs = 1
                numDisplay = ""
            case "-":
                if numbers.isEmpty {
                    numbers.append(Int(numDisplay)!)
                    tmp = numbers.last!
                }else {
                    calculate()
                }
                signs = 2
                numDisplay = ""
            case "/":
                if numbers.isEmpty {
                    numbers.append(Int(numDisplay)!)
                    tmp = numbers.last!
                }else {
                    calculate()
                }
                signs = 3
                numDisplay = ""
            case "*":
                if numbers.isEmpty {
                    numbers.append(Int(numDisplay)!)
                    tmp = numbers.last!
                }else {
                    calculate()
                }
                signs = 4
                numDisplay = ""
            case "=":
                calculate()
                numbers = []
                tmp = 0
                numDisplay = ""
            default:
                 print("no")
            }
        }
    }
    @IBAction func clearBtn(_ sender: Any) {
        numDisplay = "0"
        calcResult.text = numDisplay
    }
    
    
}

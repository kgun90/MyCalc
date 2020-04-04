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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcResult.text = "0"
        for i in 0...18{
            numBtn[i].layer.cornerRadius = 40
            numBtn[i].clipsToBounds = true
        }
    }
    
    var numDisplay: String = "0"
    var numbers: [Int] = []
    var signs = 1
    var tmp = 0
    var numReset : Bool = false
    
    @IBAction func btnClicked(_ sender: UIButton) {
        if calcResult.text == "0" || numReset{
            numDisplay = (sender.titleLabel?.text)!
            numReset = false
        }else {
            numDisplay += (sender.titleLabel?.text)!
        }
        calcResult.text = numDisplay
    }
    
   
    
    @IBAction func btnOperation(_ sender: UIButton) {
        
        if numDisplay == ""{
            
        }else {
            switch (sender.titleLabel?.text)! {
            case "+":
                signs = 1
                if numbers.isEmpty {
                    numbers.append(Int(numDisplay)!)
                    tmp = numbers.last!
                }else {
                    calculate()
                }
                
                numDisplay = ""
            case "-":
                signs = 2
                if numbers.isEmpty {
                    numbers.append(Int(numDisplay)!)
                    tmp = numbers.last!
                }else {
                    calculate()
                }
                
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
            case "%" :
                signs = 5
                calculate()
                numReset = true
                
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
    func calculate(){
           numbers.append(Int(numDisplay)!)
        print(signs)
           switch signs {
           case 1:
               tmp += numbers.last!
               calcResult.text = String(tmp)
           case 2:
               tmp -= numbers.last!
               calcResult.text = String(tmp)
           case 3:
               tmp /= numbers.last!
               calcResult.text = String(tmp)
           case 4:
               tmp *= numbers.last!
               calcResult.text = String(tmp)
           case 5:
               calcResult.text = String(0.01 * Double(numbers.last!))
               //numReset = true
           default:
               print("Wrong")
           }
           
                   
       }
    @IBAction func clearBtn(_ sender: Any) {
        numDisplay = "0"
        calcResult.text = numDisplay
    }

    
}

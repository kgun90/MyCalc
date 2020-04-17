//
//  LizhongCalViewController.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 06/04/2020.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class LizhongCalViewController: UIViewController {
    @IBOutlet weak var ParentStackView: UIStackView!
    var btnSound: AVAudioPlayer!
    @IBOutlet weak var resultLabel: UILabel!
    
    enum Operation: String{
        case divide = "/"
        case multiply = "*"
        case subtract = "-"
        case add = "+"
        case empty = "Empty"
    }
    
    var runningNumber = ""
    var currentOperation = Operation.empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    
    override func viewDidLoad() {
         let path = Bundle.main.path(forResource: "btn", ofType:"wav")
         let soundURL = URL(fileURLWithPath: path!)
         
         do{
             // try to create the audio player
             try btnSound = AVAudioPlayer(contentsOf: soundURL)
             btnSound.prepareToPlay()
         }catch let err as NSError{
             // catch error if fails -> avoid crash
             print(err.debugDescription)
         }
    }
    
    @IBAction func numberPressed(sender: UIButton){
        playsound()
        runningNumber += "\(sender.tag)"
        resultLabel.text = runningNumber
    }
    
    func playsound() {
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
    }
    
    @IBAction func onClearButton(_ sender: AnyObject) {
        currentOperation = Operation.empty
        runningNumber = ""
        resultLabel.text = "0"
        result = "0"
    }
    
    @IBAction func onDividePressed(sender: AnyObject){
        processOperation(operation: .divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject){
        processOperation(operation: .multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject){
        processOperation(operation: .subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject){
        processOperation(operation: .add)
    }
    

    @IBAction func onEqualPressed(_ sender: AnyObject) {
        processOperation(operation: currentOperation)
    }
    
    func processOperation(operation: Operation){
        playsound()
        if currentOperation != Operation.empty{
            
            // Check if user press twice an operator
            if runningNumber != ""{
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.multiply{
                    result = "\(Int(leftValStr)! * Int(rightValStr)!)"
                }else if currentOperation == Operation.divide{
                    result = "\(Int(leftValStr)! / Int(rightValStr)!)"
                }else if currentOperation == Operation.subtract{
                    result = "\(Int(leftValStr)! - Int(rightValStr)!)"
                }else if currentOperation == Operation.add{
                    result = "\(Int(leftValStr)! + Int(rightValStr)!)"
                }
                
                leftValStr = result
                resultLabel.text = result
            }
        }else{
            // First time click on operator
            leftValStr = runningNumber
            runningNumber = ""
        }
        currentOperation = operation
    }
    
    override func viewDidLayoutSubviews() {
        for view in ParentStackView.subviews{
            guard let childStackView = view as? UIStackView else {
                continue
            }
            
            // StackView인 것이다.
            for view in childStackView.arrangedSubviews {
                if let button = view as? UIButton {
                    button.layer.cornerRadius = button.frame.height * 0.50
                }
            }
        }
    }
    
}
@IBDesignable
class RoundedButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()

        let radius = min(self.bounds.width, self.bounds.height) / 2
            self.layer.cornerRadius = radius
        }
}


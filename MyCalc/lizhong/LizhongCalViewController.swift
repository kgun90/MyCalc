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
    
    enum operation: String{
        case divide = "/"
        case multiply = "*"
        case subtract = "-"
        case add = "+"
        case empty = "Empty"
    }
    
    var runningNumber = ""
    var currentOperation = operation.empty
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
    }
    
    func playsound() {
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
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


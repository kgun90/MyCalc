//
//  LizhongCalViewController.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 06/04/2020.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation
import UIKit

class LizhongCalViewController: UIViewController {
    @IBOutlet weak var ParentStackView: UIStackView!
    override func viewDidLoad() {
         
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


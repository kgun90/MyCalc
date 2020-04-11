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
    
    override func viewDidLoad() {
         
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

class RoundButton: UIButton {
    @IBOutlet weak var ParentStackView: UIStackView!
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for view in ParentStackView.arrangedSubviews{
            if let button = view as? UIButton{
                button.layer.cornerRadius = button.frame.height * 0.50
            }
        }

    }
}



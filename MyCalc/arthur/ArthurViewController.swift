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
    
    
}


class ArthurCircleButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = min(self.bounds.width, self.bounds.height)/2
    }
}

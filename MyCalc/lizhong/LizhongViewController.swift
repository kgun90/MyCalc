//
//  LizhongViewController.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 29/03/2020.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation
import UIKit

class LizhongViewController: UIViewController {
    
    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var PlusMinusButton: UIButton!
    
    override func viewDidLoad() {
        ACButton.layer.cornerRadius = 40;
        ACButton.clipsToBounds = true;
        
        PlusMinusButton.layer.cornerRadius = 40;
        PlusMinusButton.clipsToBounds = true;
    }
}

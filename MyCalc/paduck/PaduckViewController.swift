//
//  PaduckViewController.swift
//  MyCalc
//
//  Created by 정태진 on 2020/03/29.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class PaduckViewController: UIViewController {
    
    @IBOutlet weak var lable: UILabel!
    @IBOutlet var collectionOfButtons: Array<UIButton>?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        for btn in collectionOfButtons! {
            let height = btn.bounds.size.height
            btn.layer.cornerRadius = height / 2
        }
    }

    @IBAction func buttonAction(_ sender: Any) {
        guard let btn: UIButton = sender as? UIButton,
        let label = btn.titleLabel,
        let text = label.text
        else { return }
        
//        if let label = btn.titleLabel,
//            let text = label.text {
            
            print(text)
//            if
//        }
    }
}

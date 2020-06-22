//
//  UIViewController+Alert.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/06/22.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

extension UIViewController {
    func show(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        present(alert, animated: true, completion: nil)
    }
}

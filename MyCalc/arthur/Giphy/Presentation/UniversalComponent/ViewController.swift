//
//  ViewController.swift
//  MyCalc
//
//  Created by Arthur on 09/05/2020.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ViewController<ViewBindable> : UIViewController {
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
    }
    
    deinit {
        print("\(ViewBindable.self) 메모리 할당 해제됨")
    }
    
    func bind(_ viewModel: ViewBindable) {}
    
    func attribute() {}
    
    func layout() {}
    
    
    
    
}

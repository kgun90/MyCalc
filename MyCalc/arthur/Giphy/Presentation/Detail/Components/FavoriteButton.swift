//
//  FavoriteButton.swift
//  MyCalc
//
//  Created by Arthur on 09/05/2020.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation
import UIKit

enum FavoriteState {
    case favorited, notFavorited
}

class FavoriteButton: UIButton {
    
    let image = UIImage(named: "star")
    var favoriteState: FavoriteState? {
        didSet {
            if favoriteState == .notFavorited {
                self.tintColor = .gray
            } else {
                self.tintColor = .yellow
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute() {
        self.do {
            $0.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
            $0.favoriteState = .notFavorited
        }
    }
    func layout() {
        
    }
}

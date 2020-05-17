//
//  SearchCell.swift
//  MyCalc
//
//  Created by Arthur on 09/05/2020.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

class SearchCell: UICollectionViewCell {
    typealias Data = (DataModel)
    
    override var isHighlighted: Bool {
        didSet {
            shrink(down: isHighlighted)
        }
    }
    let imageView = UIImageView()  // 스크린샷 파일
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: Data) {
        imageView.do {
            $0.kf.setImage(with: URL(string: data.images?.previewGif?.url ?? ""))
        }
    }
    
    func attribute() {
        
        imageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
    }
    
    func layout() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
extension SearchCell {
    func shrink(down: Bool) {
        UIView.animate(withDuration: 0.15) {
            if down {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            } else {
                self.transform = .identity
            }
        }
    }
}

//
//  CollectionViewCell.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/05/05.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var captionLabel: UILabel!
    @IBOutlet fileprivate weak var commentLabel: UILabel!
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    // awakeFromNib()은 객체가 초기화(인스턴스화, init()이 호출된 후)된 후 호출
    // awakeFromNib()과 init() 어디에서 설정?
    // init(coder:) 시점에는 frame 이나 Layer 관련없는 값들,
    // awakeFromNib 시점에는 frame 이나 Layer 관련된 값들을 설정하도록 구현
    // 그렇다면 여기서도 init으로 구현하면 같은 값이 되려나?
    override func awakeFromNib() {
        super.awakeFromNib()
        //containerView 말고 뒤 초록색 부분도 radius값을 조정하고 싶은데...
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }

    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
                captionLabel.text = photo.caption
                commentLabel.text = photo.comment
            }
        }
    }
}

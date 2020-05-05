//
//  LizhongGiphyViewController.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/05/04.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit
import Foundation

class LizhongGiphyViewController: UICollectionViewController {
    
    var photos = Photo.allPhotos()
    
    //uistatusbarstyle 은 무엇?
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        // CollectionViewLayout delegate세팅
        if let layout = collectionView?.collectionViewLayout as? CollectionViewLayout {
            layout.delegate = self
        }
    }
}

extension LizhongGiphyViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        if let collectionViewCell = cell as? CollectionViewCell {
            collectionViewCell.photo = photos[indexPath.item]
        }
        return cell
    }
}

extension LizhongGiphyViewController : CollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return photos[indexPath.item].image.size.height
    }
}


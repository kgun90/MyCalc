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
    
    
    //등록된 photo list
    var photos = Photo.allPhotos()
    
    //uistatusbarstyle : 화면 최 상단의 bar. darkcontent, lightcontent에 따라 흰색, 검정으로 변해야 할 것 같은데 안 변함.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //상태표시줄 숨김 가능여부. 동작 안함
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //backgroundColor 설정
        if let patternImage = UIImage(named: "Pattern") {
            self.view.backgroundColor = UIColor(patternImage: patternImage)
        }
        
        //위의 view와 여기서의 collectionView는 다른 듯
        collectionView?.backgroundColor = UIColor.clear
        //CollectionView의 위치 조정. 위치조정 후 이미지 짤리는 현상 해소됨
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 0, bottom: 0, right: 0)
        
        // CollectionViewLayout delegate세팅. 재사용 및 유지면에서 delegate pattern 사용되는 경우 많음
        if let layout = collectionView?.collectionViewLayout as? CollectionViewLayout {
            layout.delegate = self
        }
    }
    
    //상태표시줄 해결 하려면? 아래 navigationController로 하니 변경됨
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }
}

//Swift에서 Extensions(확장)은 새로운 기능을 추가한다는 개념으로 사용. 존재하는 기능을 오버라이딩 할 수는 없다.
//왜 extension을 사용했을 까. 아래 두 가지 셀 아이템 갯수와 셀 아이템을 정의하는 부분은 필수
extension LizhongGiphyViewController {
    
    //셀 아이템 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    //셀 아이템 정의. 셀 아이템 갯수만큼 호출
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        if let collectionViewCell = cell as? CollectionViewCell {
            collectionViewCell.photo = photos[indexPath.item]
        }
        return cell
    }
}

//높이는 항상 프로토콜을 준수하라는 건가
extension LizhongGiphyViewController : CollectionViewLayoutDelegate {
    
    
    //CGFloat : 32비트에서는 Float 로 처리하고 64비트에서는 Double 로 처리. Float와의 차이
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return photos[indexPath.item].image.size.height
    }
}


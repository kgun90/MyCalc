//
//  MainViewController.swift
//  MyCalc
//
//  Created by Geon Kang on 2020/03/29.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import Foundation
import UIKit

import GiphyUISDK
import GiphyCoreSDK

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var gifImage : UIImageView!
}

class Gun_GiphyViewController: UIViewController {
    
    let giphy = GiphyViewController()
    let gridController = GiphyGridController()
    let searchCotroller : UISearchController = UISearchController(searchResultsController: nil)
    let searchContainerView: UIView = UIView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Giphy.configure(apiKey: "GySNZZrCfAWOl4WLuhrPUhyCHgQLGwjz")
        collectionView.dataSource = self
        collectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize.init(width: 100, height: 100)
        collectionView.collectionViewLayout = flowLayout
    }
       
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        giphy.theme = .defaultSetting     // 테마설정 automatic(폰설정에 맞춰자동?), dark, light, default가 있음
        giphy.layout = .carousel  // 레이아웃 타입 설정, waterfall(세로),carousel(가로), defaultsetting(기본설정)
        giphy.mediaTypeConfig = [.gifs, .stickers, .emoji] // 표시할 미디어 타입을 설정, 원하는 것만 표시되게 설정가능, 이모지는 레이아웃에서 가로설정 불가
       // present(giphy, animated: true, completion: nil)
    }
    @IBOutlet weak var collectionView: UICollectionView!
    override func loadView() {
        super.loadView()
        self.title = NSLocalizedString("hi", comment: "Giphy")
        
    }
    
}
extension Gun_GiphyViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.gifImage.image = UIImage.init(named: "dummy_\(indexPath.row + 1)")
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("로그 : \(collectionView.bounds.width/2)")
//        return CGSize.init(width: 100, height: 100)
//
//
//    }
    
}

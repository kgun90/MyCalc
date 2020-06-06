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


class Gun_GiphyViewController: UIViewController {
    fileprivate let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
   
    let giphy = GiphyViewController()
    let gridController = GiphyGridController()
    let searchController: UISearchController = UISearchController(searchResultsController: nil)
    let searchContainerView: UIView = UIView(frame: CGRect.zero)

    var screenSize: CGRect = UIScreen.main.bounds

    var giphyManager = GiphyManager()
    var key = "Hello"

    
    var filteredData: [String]!
    
    var urlArray:Array<searchResult> = [searchResult]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Giphy.configure(apiKey: "GySNZZrCfAWOl4WLuhrPUhyCHgQLGwjz")
        self.title = NSLocalizedString("Giphy", comment: "Giphy")

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search GIFs", comment: "The placeholder string for the Giphy search field")
        searchController.definesPresentationContext = false

        
        searchContainerView.backgroundColor = UIColor.clear
        searchContainerView.translatesAutoresizingMaskIntoConstraints = false
        searchContainerView.addSubview(searchController.searchBar)
        
        giphyManager.delegate = self
//        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        giphyManager.fetchSearch(keyword: key)
        

        self.view.addSubview(searchContainerView)
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
          searchContainerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
          searchContainerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
          searchContainerView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
          searchContainerView.heightAnchor.constraint(equalToConstant: 44.0),
                   
        ])
        collectionView.backgroundColor = .white
         NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchContainerView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: screenSize.height*0.85)
         ])
        
    }
       
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //giphy.theme = .defaultSetting     // 테마설정 automatic(폰설정에 맞춰자동?), dark, light, default가 있음
        giphy.layout = .carousel  // 레이아웃 타입 설정, waterfall(세로),carousel(가로), defaultsetting(기본설정)
        giphy.mediaTypeConfig = [.gifs, .stickers, .emoji] // 표시할 미디어 타입을 설정, 원하는 것만 표시되게 설정가능, 이모지는 레이아웃에서 가로설정 불가
//      present(giphy, animated: true, completion: nil)
    }

}
//MARK: - UISearchBarDelegate
extension Gun_GiphyViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text {
            self.key = keyword
        } else {
            self.key = "hello"
        }
       giphyManager.fetchSearch(keyword: key)
        self.collectionView.reloadData()
        print("Reload")
    }
}


//MARK: - UICollectionViewDataSource

extension Gun_GiphyViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.urlArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let aData = urlArray[indexPath.row]
//        print(aData)
        
        let url = URL(string: aData.images.fixed_height_still.url)
        if let data = try? Data(contentsOf: url!)
        {
          let image: UIImage? = UIImage(data: data)
          cell.cellImage.image = image
        }
   
        return cell
        
    }
}

//MARK: - UICollectionViewDelegate

extension Gun_GiphyViewController: UICollectionViewDelegateFlowLayout{
//셀크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collWidth = screenSize.width / 2 - 1
//        let collHeight = Float(urlArray[indexPath.row].images.preview.height) ?? 0.0
        return CGSize.init(width: collWidth, height: collWidth)
    }
////위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
////좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

//MARK: - CustomCell

class CustomCell: UICollectionViewCell {
    fileprivate let cellImage: UIImageView = {
          let iv = UIImageView()
           iv.translatesAutoresizingMaskIntoConstraints = false
           iv.contentMode = .scaleToFill
           iv.clipsToBounds = true
           return iv
       }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        contentView.addSubview(cellImage)
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cellImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(Coder:) has not been implemented")
    }
}

//MARK: - GiphyManagerDelegate

extension Gun_GiphyViewController : GiphyManagerDelegate {
    func didUpdateResult(result: [searchResult]) {
        DispatchQueue.main.async {
            self.urlArray.removeAll()
            self.urlArray.append(contentsOf: result)
            self.collectionView.reloadData()
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}

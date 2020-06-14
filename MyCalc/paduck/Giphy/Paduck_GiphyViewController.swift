//
//  Paduck_GiphyViewController.swift
//  MyCalc
//
//  Created by 정태진 on 2020/04/24.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit
import Foundation

class Paduck_GiphyViewController: UIViewController {
    
    let API_KEY = "GySNZZrCfAWOl4WLuhrPUhyCHgQLGwjz"
    let requestString = "https://api.giphy.com/v1/gifs/search"
    
    @IBOutlet var collectionView: UICollectionView!
    
    let photos = Photo.allPhotos()
    
    override func viewDidLoad() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        
        let reqStr = "\(requestString)?api_key=\(API_KEY)&q=똥"
        let reqStrEncoded = reqStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let _reqStrEncoded = reqStrEncoded else {
            return
        }
        
        if let requestURL = URL(string: _reqStrEncoded) {
            var request = URLRequest(url: requestURL)
            request.httpMethod = "GET"
            print("url: \(requestURL)")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
//                print(error)
//                print(response)
//                print(data)
                
                if let data = data  {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        
                    }
                }
            }
            
            task.resume()
        } else {
            print("실패")
        }
    }
    
    
}

extension Paduck_GiphyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        
        if let paduckCell = cell as? PaduckCustumCell {
            paduckCell.imageView.image = photos[indexPath.item].image
        }
        return cell
    }
    
    
}

extension Paduck_GiphyViewController {
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photos.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
//        if let collectionViewCell = cell as? CollectionViewCell {
//            collectionViewCell.photo = photos[indexPath.item]
//        }
//        return cell
//    }
}
 
extension Paduck_GiphyViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2 - 10
        
        return CGSize.init(width: width , height: width * photos[indexPath.item].image.size.height / photos[indexPath.item].image.size.width )
        
//        return CGSize(width: <#T##Int#>, height: <#T##Int#>)
    }
//    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
//        return photos[indexPath.item].image.size.height
//    }
}

class PaduckCustumCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
}

class __Paduck_GiphyViewController: UIViewController {
    
    let API_KEY = "GySNZZrCfAWOl4WLuhrPUhyCHgQLGwjz"
    let requestString = "https://api.giphy.com/v1/gifs/search"
    
    override func viewDidLoad() {
        
        let reqStr = "\(requestString)?api_key=\(API_KEY)&q=똥"
        let reqStrEncoded = reqStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        print("loaded")
        print("reqStr: \(reqStr)")
        print("reqStrEncoded: \(reqStrEncoded)")
//        if let reqStrEncoded = reqStrEncoded {
//            let requestURL = URL(string: reqStrEncoded)
//            print("url: \(requestURL)")
//        }
        
        guard let _reqStrEncoded = reqStrEncoded else {
            return
        }
        
        if let requestURL = URL(string: _reqStrEncoded) {
            var request = URLRequest(url: requestURL)
            request.httpMethod = "GET"
            print("url: \(requestURL)")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                print(error)
                print(response)
                print(data)
            }
            
            task.resume()
        } else {
            print("실패")
        }
    }
}


// model
struct JsonRequest : Codable {
    
}

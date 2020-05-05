//
//  Photo.swift
//  MyCalc
//
//  Created by ChungHyun Lee on 2020/05/05.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

struct Photo {
    
    var caption: String
    var comment: String
    var image: UIImage
    
    init(caption: String, comment: String, image: UIImage) {
        self.caption = caption
        self.comment = comment
        self.image = image
    }
    
    //초기화 nil ?
    init?(dictionary: [String: String]) {
        guard let caption = dictionary["Caption"], let comment = dictionary["Comment"],
            let photo = dictionary["Photo"], let image = UIImage(named: photo) else {
                return nil
        }
        self.init(caption: caption, comment: comment, image: image)
    }
    
    //NSArray는 무엇?
    static func allPhotos() -> [Photo] {
        var photos = [Photo]()
        guard let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let photosFromPlist = NSArray(contentsOf: URL) as? [[String:String]] else {
                return photos
        }
        for dictionary in photosFromPlist {
            if let photo = Photo(dictionary: dictionary) {
                print(photo.comment)
                photos.append(photo)
            }
        }
        print(photos.count)
        return photos
    }
}

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
    
    //인자값이 특정한 조건일 경우 인스턴스 객체가 세팅되지 않고 nil로 만드는 initializer
    init?(dictionary: [String: String]) {
        guard let caption = dictionary["Caption"], let comment = dictionary["Comment"],
            let photo = dictionary["Photo"], let image = UIImage(named: photo) else {
                return nil
        }
        self.init(caption: caption, comment: comment, image: image)
    }
    
    //Array는 구조체이므로 Swift의 값 유형.
    //NSArray는 불변의 Objective C 클래스이므로 Swift의 참조 유형이며 Array<AnyObject>에 연결
    //NSMutableArray는 NSArray의 가변 하위 클래스
    //그 안에 구현된 함수도 사용 가능
    static func allPhotos() -> [Photo] {
        var photos = [Photo]()
        guard let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let photosFromPlist = NSArray(contentsOf: URL) as? [[String:String]] else {
                return photos
        }
        for dictionary in photosFromPlist {
            if let photo = Photo(dictionary: dictionary) {
                photos.append(photo)
            }
        }
        return photos
    }
}

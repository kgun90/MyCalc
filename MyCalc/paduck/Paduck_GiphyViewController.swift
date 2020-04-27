//
//  Paduck_GiphyViewController.swift
//  MyCalc
//
//  Created by 정태진 on 2020/04/24.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

class Paduck_GiphyViewController: UIViewController {
    
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

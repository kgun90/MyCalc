//
//  WMainViewController.swift
//  MyCalc
//
//  Created by 정태진 on 2020/06/14.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit
import Foundation

class WMainViewController: UIViewController {
    let API_KEY = "1f4a322402a5052d49663dc4394f2313"
    let requestString = "http://api.openweathermap.org/data/2.5/weather"
    
    override func viewDidLoad() {
        let _let = CGFloat(37.4769484)
        let _lon = CGFloat(126.9434709)
        let reqStr = "\(requestString)?lat=\(_let)&lon=\(_lon)&appid=\(API_KEY)"
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

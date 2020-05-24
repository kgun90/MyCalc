//
//  GiphyManager.swift
//  MyCalc
//
//  Created by Geon Kang on 2020/05/16.
//  Copyright © 2020 Geon Kang. All rights reserved.

import Foundation

protocol GiphyManagerDelegate {
    func didUpdateResult(result: [searchResult])
    func didFailWithError(error: Error)
}
struct GiphyManager {
    let https = "https://"
    let giphyURL = "api.giphy.com/v1/gifs/search?"
    let APIKey = "GySNZZrCfAWOl4WLuhrPUhyCHgQLGwjz"
    let gifLimit = 5
    
    var delegate: GiphyManagerDelegate?
    
    func fetchSearch(keyword: String) {
        let urlString = "\(https)\(giphyURL)&api_key=\(APIKey)&q=\(keyword)&=\(gifLimit)"
        print(urlString)
        performRequest(with: urlString, with: keyword)
    }
    
    func performRequest(with urlString: String, with keyword: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let result = self.parseJSON(safeData, keyword){
                        self.delegate?.didUpdateResult(result: result)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ resultData: Data, _ keyword: String) -> [searchResult]?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResultData.self, from: resultData)
            let dataArray = decodedData.data
            
            return dataArray

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

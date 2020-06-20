
import UIKit

//실제 json형식과 일치시켜야함. 
struct WeatherSummary: Codable {
    struct items: Codable {
        struct item: Codable {
            let category: String
            let obsrValue: Double
        }
        
        let item: [item]
    }
}

let apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?serviceKey=iqeBy73T8ftJ2PhxFNwMQehC1%2FFSefxMlUdwnug93YLsEVnS983m3JYzJe0qgfun4Mp3%2FLCVap1nRwWZ84bopA%3D%3D&pageNo=1&numOfRows=10&dataType=json&base_date=20200620&base_time=2000&nx=62&ny=121&"

let url = URL(string: apiUrl)!

let session = URLSession.shard

let task = session.dataTask(with: url) { (data, response, error) in
    
    if let error = error {
        print(error)
        return
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
        print("Invalid Response")
        return
    }
    
    guard (200...299).contains(httpResponse.statusCode) else {
        print("/(httpResponse.statusCode)")
        return
    }
    
    guard let data = data else {
        fatalError("Invalid data")
    }
    
    do {
        
        let decoder = JSONDecoder()
        let summary = try decoder.decode(WeatherSummary.self, from: data)
        
        summary.items.item.first?.category
        
    } catch {
        print(error)
    }
}

task.resume()

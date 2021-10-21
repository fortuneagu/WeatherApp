//
//  DataLoader.swift
//  WeatherApp
//
//  Created by mac on 8/9/21.
//

import UIKit

//MARK: - Variables to get data from API
class DataLoader {
    
    let apiKey = "ab93f8ab58bdff69932f09dc12d7af26"
    let location: String = "Lokoja"
    
    
  //MARK: - Method to get current weather data from API
func pullJSONData(completionHandler: @escaping (MainWeather) -> ()) {
    let url = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)"
    
    if let url = URL(string: url) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(MainWeather.self, from: data)
                    print("Here is the data")
                    completionHandler(json)
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
    //MARK: - Method to get forecast data from API
    func getForecastJson(completionHandler: @escaping (ForecastResponse) -> ()) {
        
        
        let url = "https://api.openweathermap.org/data/2.5/forecast?q=\(location)&appid=\(apiKey)&units=metric"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(ForecastResponse.self, from: data)
                        print("Here is the data")
                        completionHandler(json)
                    } catch {
                        print("\(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
}

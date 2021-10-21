//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by mac on 8/9/21.
//

import UIKit

//MARK: - Model for the current forecast
struct MainWeather: Decodable {
    let main: MainWeatherDetails
    let weather: [WeatherItems]
}

struct WeatherItems: Decodable {
    let main: String
}

struct MainWeatherDetails: Decodable {
    var temp: Double
    var temp_min: Double
    var temp_max: Double
}

//MARK: - Model for the forecast
struct ForecastResponse: Decodable {
    let list: [ListDetails]
}

struct ListDetails: Decodable {
    var dt: Double
    let main: MainDetails
    let weather: [WeatherDetails]
}

struct MainDetails: Decodable {
    let temp: Double
}

struct WeatherDetails: Decodable {
    let main: String
}

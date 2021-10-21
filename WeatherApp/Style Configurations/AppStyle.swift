//
//  AppStyle.swift
//  WeatherApp
//
//  Created by mac on 8/12/21.
//

import UIKit

enum AppStyle {
    case rainy
    case cloudy
    case sunny
    case others
    
    //MARK: - Style code for color
    var color: UIColor {
        switch self {
        case .rainy:
            return UIColor(red: 0.34, green: 0.34, blue: 0.36, alpha: 1)
        case .cloudy:
            return UIColor(red: 0.38, green: 0.52, blue: 0.58, alpha: 1)
        case .sunny:
            return UIColor(red: 0.29, green: 0.56, blue: 0.89, alpha: 1)
        case .others:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1)
        }
    }
    
    //MARK: - Style code for images according to the weather description
    var weatherImage: UIImage {
        switch self {
        case .rainy:
            return UIImage(named: "sea_rainy")!
        case .cloudy:
            return UIImage(named: "sea_cloudy")!
        case .sunny:
            return UIImage(named: "sea_sunny")!
        case .others:
            return UIImage(named: "default")!
        }
    }
    
    //MARK: - Style code for icons according to weather description
    var forecastIcon: UIImage {
        switch self{
        case .rainy:
            return UIImage(named: "rain")!
        case .cloudy:
            return UIImage(named: "partlysunny")!
        case .sunny:
            return UIImage(named: "clear")!
        case .others:
        return UIImage(named: "clear")!
        }
    }
}

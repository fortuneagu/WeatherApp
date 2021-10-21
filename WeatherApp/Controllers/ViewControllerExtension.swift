//
//  ViewControllerInjector.swift
//  WeatherApp
//
//  Created by mac on 8/11/21.
//

import UIKit


extension ViewController {
    
    //MARK: - Method to assign and display weather data
   public func populateItems() {
        dataLoader.pullJSONData { [weak self] data in
            guard let selfReference = self else { return }
            print(data)
            selfReference.weather = data
            print(selfReference.weather!)
            
            //MARK: - Codes to be run on main thread
            DispatchQueue.main.async {
                
                //MARK: - Assigning variable values to the display labels and running in the main thread.
                selfReference.currentDayTemperature.text = "\(Int(selfReference.weather?.main.temp ?? 273) - 273)°"
                selfReference.maximumDayTemperature.text = "\(Int((selfReference.weather?.main.temp_max) ?? 273) - 273)°"
                selfReference.minimumDayTemperature.text = "\(Int((selfReference.weather?.main.temp_min) ?? 273) - 273)°"
                selfReference.currentDayMainDisplay.text = "\(Int(selfReference.weather?.main.temp ?? 0) - 273)°"
                selfReference.weatherDescription.text = "\((selfReference.weather?.weather[0].main) ?? "")".uppercased()
            
                //MARK: - Block of code to make view adaptive to the weather description
                switch selfReference.weatherDescription.text {
                case "SUNNY":
                    selfReference.weatherImageView.image = AppStyle.sunny.weatherImage
                    selfReference.topView.backgroundColor = AppStyle.sunny.color
                    selfReference.superView.backgroundColor = AppStyle.sunny.color
                case "CLOUDS":
                    selfReference.weatherImageView.image = AppStyle.cloudy.weatherImage
                    selfReference.topView.backgroundColor = AppStyle.cloudy.color
                    selfReference.superView.backgroundColor = AppStyle.cloudy.color
                case "RAIN":
                    selfReference.weatherImageView.image = AppStyle.rainy.weatherImage
                    selfReference.topView.backgroundColor = AppStyle.rainy.color
                    selfReference.superView.backgroundColor = AppStyle.rainy.color
                default:
                    selfReference.weatherImageView.image = AppStyle.others.weatherImage
                    selfReference.topView.backgroundColor = AppStyle.others.color
                    selfReference.superView.backgroundColor = AppStyle.others.color
                }
            }
        }
        
        //MARK: - Block of code to populate forecast data
        dataLoader.getForecastJson { [weak self] data in
            guard let selfReference = self else { return }
            print(data)
            selfReference.forecastWeather = data
            

            //MARK: - Assigning description for daily forecast weather used to determine the icon to be displayed
            selfReference.firstDayWeatherDescription = (selfReference.forecastWeather?.list[0].weather[0].main) ?? ""
            selfReference.secondDayWeatherDescription = (selfReference.forecastWeather?.list[8].weather[0].main) ?? ""
            selfReference.thirdDayWeatherDescription = (selfReference.forecastWeather?.list[16].weather[0].main) ?? ""
            selfReference.fourthDayWeatherDescription = (selfReference.forecastWeather?.list[24].weather[0].main) ?? ""
            selfReference.fifthDayWeatherDescription = (selfReference.forecastWeather?.list[32].weather[0].main) ?? ""
            
            //MARK: - Running UI related task in the main thread
            DispatchQueue.main.async {
                
                //assigning variable value to each forecast label outlet and running in the main thread
                selfReference.dayOneTemperature.text = "\(Int((selfReference.forecastWeather?.list[0].main.temp) ?? 0))°"
                selfReference.dayTwoTemperature.text = "\(Int((selfReference.forecastWeather?.list[8].main.temp) ?? 0))°"
                selfReference.dayThreeTemperature.text = "\(Int((selfReference.forecastWeather?.list[16].main.temp) ?? 0))°"
                selfReference.dayFourTemperature.text = "\(Int((selfReference.forecastWeather?.list[24].main.temp) ?? 0))°"
                selfReference.dayFiveTemperature.text = "\(Int((selfReference.forecastWeather?.list[32].main.temp) ?? 0))°"
                
                //MARK: - Assigning appropriate image to the first day weather icon depending on weather description
                switch selfReference.firstDayWeatherDescription {
                case "Sunny":
                    selfReference.dayOneImage.image = AppStyle.sunny.forecastIcon
                case "Clouds":
                    selfReference.dayOneImage.image = AppStyle.cloudy.forecastIcon
                case "Rain":
                    selfReference.dayOneImage.image = AppStyle.rainy.forecastIcon
                default:
                    selfReference.dayOneImage.image = AppStyle.others.forecastIcon
                }
                
                //MARK: - Assigning appropriate image to the second day weather icon depending on weather description
                switch selfReference.secondDayWeatherDescription {
                case "Sunny":
                    selfReference.dayTwoImage.image = AppStyle.sunny.forecastIcon
                case "Clouds":
                    selfReference.dayTwoImage.image = AppStyle.cloudy.forecastIcon
                case "Rain":
                    selfReference.dayTwoImage.image = AppStyle.rainy.forecastIcon
                default:
                    selfReference.dayTwoImage.image = AppStyle.others.forecastIcon
                }
                
                //MARK: - Assigning appropriate image to the third day weather icon depending on weather description
                switch selfReference.thirdDayWeatherDescription {
                case "Sunny":
                    selfReference.dayThreeImage.image = AppStyle.sunny.forecastIcon
                case "Clouds":
                    selfReference.dayThreeImage.image = AppStyle.cloudy.forecastIcon
                case "Rain":
                    selfReference.dayThreeImage.image = AppStyle.rainy.forecastIcon
                default:
                    selfReference.dayThreeImage.image = AppStyle.others.forecastIcon
                }
                
                //MARK: - Assigning appropriate image to the fourth day weather icon depending on weather description
                switch selfReference.fourthDayWeatherDescription {
                case "Sunny":
                    selfReference.dayFourImage.image = AppStyle.sunny.forecastIcon
                case "Clouds":
                    selfReference.dayFourImage.image = AppStyle.cloudy.forecastIcon
                case "Rain":
                    selfReference.dayFourImage.image = AppStyle.rainy.forecastIcon
                default:
                    selfReference.dayFourImage.image = AppStyle.others.forecastIcon
                }
                
                //MARK: - Assigning appropriate image to the fifth day weather icon depending on weather description
                switch selfReference.fifthDayWeatherDescription {
                case "Sunny":
                    selfReference.dayFiveImage.image = AppStyle.sunny.forecastIcon
                case "Clouds":
                    selfReference.dayFiveImage.image = AppStyle.cloudy.forecastIcon
                case "Rain":
                    selfReference.dayFiveImage.image = AppStyle.rainy.forecastIcon
                default:
                    selfReference.dayFiveImage.image = AppStyle.others.forecastIcon
                }
                
                //MARK: - Modifying text for each label
                selfReference.firstDayName.text = selfReference.formatDate(Date(timeIntervalSince1970: Double(selfReference.forecastWeather?.list[0].dt ?? 0)))
                selfReference.secondDayName.text = selfReference.formatDate(Date(timeIntervalSince1970: Double(selfReference.forecastWeather?.list[8].dt ?? 0)))
                selfReference.thirdDayName.text = selfReference.formatDate(Date(timeIntervalSince1970: Double(selfReference.forecastWeather?.list[16].dt ?? 0)))
                selfReference.fourthDayName.text = selfReference.formatDate(Date(timeIntervalSince1970: Double(selfReference.forecastWeather?.list[24].dt ?? 0)))
                selfReference.fifthDayName.text = selfReference.formatDate(Date(timeIntervalSince1970: Double(selfReference.forecastWeather?.list[32].dt ?? 0)))
            }
        }
    }
    
    //MARK: - Method to modify according to current day
    func formatDate(_ date: Date?) -> String {
        guard let inputDate = date else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: inputDate)
    }
}

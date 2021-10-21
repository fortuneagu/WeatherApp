//
//  ViewController.swift
//  WeatherApp
//
//  Created by mac on 8/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Temperature and display outlets for single day weather details
    @IBOutlet weak var currentDayTemperature: UILabel!
    @IBOutlet weak var currentDayMainDisplay: UILabel!
    @IBOutlet weak var minimumDayTemperature: UILabel!
    @IBOutlet weak var maximumDayTemperature: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    //MARK: - Temperature outlets for five day forecast
    @IBOutlet weak var dayOneTemperature: UILabel!
    @IBOutlet weak var dayTwoTemperature: UILabel!
    @IBOutlet weak var dayThreeTemperature: UILabel!
    @IBOutlet weak var dayFourTemperature: UILabel!
    @IBOutlet weak var dayFiveTemperature: UILabel!
    
    //MARK: - Icons for five day forecast
    @IBOutlet weak var dayOneImage: UIImageView!
    @IBOutlet weak var dayTwoImage: UIImageView!
    @IBOutlet weak var dayThreeImage: UIImageView!
    @IBOutlet weak var dayFourImage: UIImageView!
    @IBOutlet weak var dayFiveImage: UIImageView!
    
    //MARK: - Outlets for Daily namings.
    @IBOutlet weak var firstDayName: UILabel!
    @IBOutlet weak var secondDayName: UILabel!
    @IBOutlet weak var thirdDayName: UILabel!
    @IBOutlet weak var fourthDayName: UILabel!
    @IBOutlet weak var fifthDayName: UILabel!
    
    //MARK: - Views whose colors would be mutated
    @IBOutlet weak var topView: UIView!
    @IBOutlet var superView: UIView!
    
    //MARK: - Image view to be mutated
    @IBOutlet weak var weatherImageView: UIImageView!
    
    //MARK: - Injecting the data from the dataloader class
    let dataLoader = DataLoader()
    var weather: MainWeather?
    var forecastWeather: ForecastResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateItems()
    }
    
    //MARK: - Declaring variables to hold the weather description for the forecast days
    var firstDayWeatherDescription: String = ""
    var secondDayWeatherDescription: String = ""
    var thirdDayWeatherDescription: String = ""
    var fourthDayWeatherDescription: String = ""
    var fifthDayWeatherDescription: String = ""
}

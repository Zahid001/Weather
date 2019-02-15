//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Duc Tran on 6/11/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    let forecastAPIKey = "188209c2fd03902e5f661c8ef2da5fa9"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
                if let currentWeather = currentWeather {
                    DispatchQueue.main.async {
                        if let temperature = currentWeather.temperature {
                            //temperature = Int(temperature)
                            self.temperatureLabel.text = "\(Int(temperature))°"
                        } else {
                            self.temperatureLabel.text = "-"
                        }
                    }
                }
        }

    }


}
















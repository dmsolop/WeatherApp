//
//  WeatherModel.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 30.06.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import UIKit

class WeatherModel {
    
    let temperature: Float
    let windSpeed: Float?
    let weatherDescription: String?
    let weatherIconPath: String?
    
    var imagePath: String? {
        return weatherIconPath.map { "http://openweathermap.org/img/w/" + $0 + ".png" }
    }
    
    init(temperature: Float, windSpeed: Float?, weatherDescription: String?, weatherIconPath: String?) {
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.weatherDescription = weatherDescription
        self.weatherIconPath = weatherIconPath
    }
    
    enum WeatherKind: String {
        case clear = "Clear"
        case cloudy = "Cloudy"
        case rainy = "Rainy"
        case snowy = "Snowy"
        
        var icon: UIImage? {
            switch self {
            case .clear:
                return #imageLiteral(resourceName: "sunny")
            default:
                return #imageLiteral(resourceName: "cloudy")
            }
        }
    }
}

class WeatherModelParser: Parsing {
    
    func parseResult(_ result: Any?) -> Any? {
        guard let resultDict = result as? [String : Any],
            let mainDict = resultDict["main"] as? [String : Any],
            let temperature = mainDict["temp"] as? Float
            else {
                return nil
        }
        
        let weatherDict = (resultDict["weather"] as? [[String : Any]])?.first
        let description = weatherDict?["description"] as? String
        let windDict = resultDict["wind"]
        let windSpeedParse = windDict as? Float
        
        let iconName = weatherDict?["icon"] as? String
        
        return WeatherModel(temperature: temperature,
                            windSpeed: windSpeedParse,
                            weatherDescription: description,
                            weatherIconPath: iconName)
    }
}

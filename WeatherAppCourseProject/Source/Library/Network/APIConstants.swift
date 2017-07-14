//
//  APIConstants.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 14.07.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import Foundation

struct APIConstants {
    
    static let baseURL = "http://api.openweathermap.org/data/2.5/"
    static let apiKey = "00fde01cffb6737561d2eb0c300727ec"
    
    struct Path {
        static let weather = "weather"
        
    }
    
    struct Keys {
        static let appID = "appid"
        struct Coordinates {
            static let latitude = "lat"
            static let longitude = "lon"
        }
    }
}

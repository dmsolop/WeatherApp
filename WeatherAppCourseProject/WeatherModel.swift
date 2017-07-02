//
//  WeatherModel.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 30.06.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import UIKit

class WeatherModel: NSObject {
    
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

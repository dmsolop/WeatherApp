//
//  WeatherCoordinateRequest.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 14.07.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import UIKit

class WeatherCoordinateRequest: NetworkRequest {

    let latitude: Double
    let longitude: Double
    
    init(session: URLSession = URLSession.shared, latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        super.init(session: session)
    }
    
    override var path: String {
        return APIConstants.Path.weather
    }
    
    override var bodyParameters: [String : Any]? {
        return [APIConstants.Keys.Coordinates.latitude: latitude,
                APIConstants.Keys.Coordinates.longitude: longitude]
    }

    override var resultParser: Parsing {
        return WeatherModelParser()
    }
}

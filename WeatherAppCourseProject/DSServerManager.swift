//
//  DSServerManager.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 29.06.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import UIKit

class DSServerManager: NSObject {
    
    private static var uniqueInstance: DSServerManager?
    
    private override init() {}
    
    static func sharedManager() -> DSServerManager {
        if uniqueInstance == nil {
            uniqueInstance = DSServerManager()
        }
    }
    
    func getCurrentWeatherForCity(city: String,
                                  country: String,
                                  onSuccess: (_ array:Array<Any>)->(),
                                  onFailure: (_ error:Error, _ statusCode:Int)->()) -> Void {
        <#function body#>
    }
    
    func getSession() {
        let session = URLSession.shared
        let request = URLRequest
    }

}

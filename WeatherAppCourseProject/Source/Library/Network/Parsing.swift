//
//  Parsing.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 14.07.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import Foundation

protocol Parsing {
    
    func parseResult(_ result: Any?) -> Any?
}

extension Parsing {
    
    func parseResult(_ result: Any?) -> Any? {
        return result
    }
    
}



//extension Parsing {
//    
//    func parseData(_ data: Data) -> Any? {
//        let result = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//        
//        return result
//    }
//
//}

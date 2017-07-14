//
//  NetworkRequest.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 12.07.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import UIKit

fileprivate struct APIStatusCode {
    static let success = 200
}

class NetworkRequest: Parsing {
    
    let session: URLSession
    private var task: URLSessionDataTask?
    
    private var urlPath: String {
        return APIConstants.baseURL + path
    }
    
    var request: URLRequest? {
        let path = urlPath
        let baseParameters = "?" + APIConstants.Keys.appID + "=" + APIConstants.apiKey + "&units=metric"
        
        let string = bodyParameters?.map { (key, value) in
            return key + "=" + String(describing: value)
            }
            .reduce(baseParameters) { (string, parameter) -> String in
            return string + "&" + parameter
        } ?? baseParameters

        return URL(string: path + string).map { URLRequest.init(url: $0) }
    }

    //MARK: - Methods to override
    
    var path: String {
        return ""
    }
    
    var bodyParameters: [String: Any]? {
        return nil
    }
    
    var resultParser: Parsing {
        return self
    }
    
    init(session: URLSession = URLSession.shared){
        self.session = session
    }
    
    func execute(completion: @escaping  (Any?, Error?) -> Void) {
        guard let request = request else {
            return
        }
        task = session.dataTask(with: request) { [weak self] (data, response, error) in
            
            guard (response as? HTTPURLResponse)?.statusCode == 200, error == nil else {
                completion (nil, error)
                return
            }
            let result = data.flatMap { self?.parseData($0) }
            completion(self?.resultParser.parseResult(result), nil)

        }
        task?.resume()
    }
    
    fileprivate func parseData(_ data: Data) -> Any? {
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
    
    func cancel() {
        task?.cancel()
    }

}

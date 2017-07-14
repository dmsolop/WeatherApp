//
//  ViewController.swift
//  WeatherAppCourseProject
//
//  Created by Mac on 27.06.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    var apiRequest: NetworkRequest?
    
    var weatherModel: WeatherModel?

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiRequest = WeatherCoordinateRequest.init(latitude: 35, longitude: 139)
    }

    @IBAction func execute(_ sender: Any) {
        apiRequest?.execute { [weak self] (result, error) in
        self?.weatherModel = result as? WeatherModel
        }
    }
    
}

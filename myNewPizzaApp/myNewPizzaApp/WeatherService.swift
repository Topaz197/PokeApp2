//
//  WeatherService.swift
//  myNewPizzaApp
//
//  Created by Anthony Rodriguez on 8/21/17.
//  Copyright © 2017 Anthony Rodriguez. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherService
{
    static func callWeatherAPI(location:CLLocationCoordinate2D, completion:@escaping(Error?, Int?)->())
    {
        // Pretend I did stuff
        completion(nil, 84)
    }
}

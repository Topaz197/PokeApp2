//
//  ViewModel.swift
//  myNewPizzaApp
//
//  Created by Anthony Rodriguez on 8/21/17.
//  Copyright © 2017 Anthony Rodriguez. All rights reserved.
//

import Foundation
import CoreLocation

protocol VMDelegate:class
{
    func updateLabels(pokemon:Pokemon?)
}

class ViewModel
{
    weak var viewController:VMDelegate?
    
    init(delegate:VMDelegate? = nil)
    {
        self.viewController = delegate
    }
    
    func changeFtoC(temp:Int) -> Int
    {
        return Int(round(Double(temp-32) / 1.8))
    }
    
    func changeCtoF(temp:Int) -> Int
    {
        return Int(round(Double(temp) * 1.8 + 32))
    }
    
    func getPokemon(id:Int)
    {
        Networking.callApi(url: "http://pokeapi.co/api/v2/pokemon/\(id)/"){
         [unowned self] (pokemon, error) in
            self.viewController?.updateLabels(pokemon: pokemon)
        }
    }
    
    /*func getWeatherAPI()
    {
        let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(33.89), longitude: CLLocationDegrees(-84.38))
        WeatherService.callWeatherAPI(location: location){
            [unowned self] (error, temp) in
            guard error == nil else {return}
            guard let temp = temp else {return}
            //self.viewController?.updateWeatherLabel(temp: temp)
        }
    }*/
}

//
//  Networking.swift
//  myNewPizzaApp
//
//  Created by Anthony Rodriguez on 8/22/17.
//  Copyright © 2017 Anthony Rodriguez. All rights reserved.
//

import Foundation

class Networking
{
    static func callApi(url:String, completion:@escaping (Pokemon?, Error?)->())
    {
        let session = URLSession.shared
        guard let url = URL(string: url) else {return}
        let task = session.dataTask(with: url)
        { (data, response, error) in
            guard error == nil else
            {
                completion(nil, error!)
                return
            }
            if let response = response
            {
                print(response)
            }
            
            if let data = data
            {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: data)
                    guard let dictionary = jsonObject as? [String:Any] else {print("Error: Json is not readable"); completion(nil, nil)
                        return}
                    
                    guard let pokemonAbilitiesArray:[[String:Any]] = dictionary["abilities"] as? [[String:Any]] else {print("Json does not contain 'abilities'"); completion(nil, nil)
                        return}
                    
                    let abilitiesArray:[String] = pokemonAbilitiesArray.flatMap{
                        guard let type = $0["ability"] as? [String:Any] else {return nil}
                        guard let name = type["name"] as? String else {return nil}
                        return name
                    }
                    print(abilitiesArray)
                    
                    guard let pokemonTypesArray:[[String:Any]] = dictionary["types"] as? [[String:Any]] else {print("Json does not contain 'types'"); completion(nil, nil)
                        return}
                    
                    let typesArray:[String] = pokemonTypesArray.flatMap{
                        guard let type = $0["type"] as? [String:Any] else {return nil}
                        guard let name = type["name"] as? String else {return nil}
                        return name
                    }
                    print(typesArray)
                    
                    guard let name:String = dictionary["name"] as? String else {print("Json does not contain 'name'");completion(nil, nil); return}
                    print(name)
                    
                    guard let height:Int = dictionary["height"] as? Int else {print("Json does not contain 'height'");completion(nil, nil); return}
                    print(height)
                    
                    guard let weight:Int = dictionary["weight"] as? Int else {print("Json does not contain 'weight'");completion(nil, nil); return}
                    print(weight)
                    
                    guard let baseXP:Int = dictionary["base_experience"] as? Int else {print("Json does not contain 'base_experience'");completion(nil, nil); return}
                    print(baseXP)
                    
                    guard let id:Int = dictionary["id"] as? Int else {print("Json does not contain 'id'");completion(nil, nil); return}
                    print(id)
                    
                    let pokemon = Pokemon(name: name, id: id, height: height, weight: weight, baseXP: baseXP, abilities: abilitiesArray, types: typesArray)
                    completion(pokemon, nil)
                } catch let error{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}

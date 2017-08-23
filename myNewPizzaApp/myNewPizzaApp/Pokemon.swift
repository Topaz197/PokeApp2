//
//  Pokemon.swift
//  myNewPizzaApp
//
//  Created by Anthony Rodriguez on 8/22/17.
//  Copyright © 2017 Anthony Rodriguez. All rights reserved.
//

import Foundation

class Pokemon
{
    let name:String
    let id:Int
    let height:Int
    let weight:Int
    let baseXP:Int
    let abilities:[String]
    let types:[String]
    
    init(name:String, id:Int, height:Int, weight:Int, baseXP:Int, abilities:[String], types:[String])
    {
        self.name = name
        self.id = id
        self.height = height
        self.weight = weight
        self.baseXP = baseXP
        self.abilities = abilities
        self.types = types
    }
}

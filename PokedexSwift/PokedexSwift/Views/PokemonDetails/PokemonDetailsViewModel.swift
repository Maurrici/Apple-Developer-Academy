//
//  PokemonDetailsViewModel.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 29/06/23.
//

import Foundation

class PokemonDetailsViewModel {
    var maxStat: [String:Int] = [
        "attack": 134,
        "defense": 180,
        "speed": 150,
        "hp": 250,
        "xp": 395
    ]
    
    var nameStat: [String: String] = [
        "attack": "ATK",
        "defense": "DEF",
        "speed": "SPD",
        "hp": " HP",
        "xp": " XP"
    ]
    
    func getPercentOfStat(stat: String, value: Int) -> Double{
        if let maxValue = maxStat[stat]{
            return Double(value)*0.65/Double(maxValue)
        }
        
        return 0.0
    }
    
}

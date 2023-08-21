//
//  Pokemon.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 23/06/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    var id: Int = 0
    var species: InfoDefault = InfoDefault()
    var weight: Double = 0.0
    var height: Double = 0.0
    var baseExperience: Int = 0
    var stats: [Stats] = []
    var sprites: Sprites = Sprites()
    var types: [Types] = []
}

struct Sprites: Decodable {
    var frontDefault: String = ""
    var backDefault: String = ""
    
    var frontURL: URL? {
        URL(string: self.frontDefault) ?? nil
    }
    var backURL: URL? {
        URL(string: self.backDefault) ?? nil
    }
}

struct Types: Decodable {
    var type: InfoDefault = InfoDefault()
}

struct Stats: Decodable {
    var baseStat: Int
    var stat: InfoDefault
}

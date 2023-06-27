//
//  Pokemon.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 23/06/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable{
    var id: Int = 0
    var sprites: Sprites = Sprites()
    var types: [Types] = []
    var species: InfoDefault = InfoDefault()
}

struct Sprites: Decodable{
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

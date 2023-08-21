//
//  Player.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import Foundation

struct PlayerModel: Identifiable{
    var id: UUID = UUID()
    var name: String = ""
    var age: Int = 0
    var position: Position = Position.none
    var image: Data? = nil
}

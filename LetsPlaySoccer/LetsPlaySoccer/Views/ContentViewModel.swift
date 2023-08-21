//
//  ContentViewModel.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    var playerRepository = PlayerRepository()
    
    @Published var players: [PlayerModel] = []
    
    func updatePlayers(){
        self.players = playerRepository.getAllPlayers()
    }
}

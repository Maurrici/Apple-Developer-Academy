//
//  AddPlayerViewModel.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import Foundation

class AddPlayerViewModel: ObservableObject {
    private var playerRepository: PlayerRepository = PlayerRepository()
    
    func addPlayer(_ newPlayer: PlayerModel){
        // Validação aqui
        
        playerRepository.createPet(newPlayer)
    }
}

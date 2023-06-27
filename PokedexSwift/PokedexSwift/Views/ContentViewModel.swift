//
//  ContentViewModel.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 23/06/23.
//

import Foundation


class ContentViewModel: ObservableObject{
    @Published var pokemons: [Pokemon] = []
    
    func updateList(search: String) async {
        self.pokemons = await PokeAPI.getAllPokemons(page: 1)
    }
}

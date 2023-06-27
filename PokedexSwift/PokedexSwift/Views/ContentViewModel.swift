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
        let pokemonList = await PokeAPI.getAllPokemons(page: 1)
        
        self.pokemons = pokemonList.sorted(by: { $0.id < $1.id })
    }
}

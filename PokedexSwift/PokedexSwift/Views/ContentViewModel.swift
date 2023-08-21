//
//  ContentViewModel.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 23/06/23.
//

import Foundation
import UIKit

class ContentViewModel: ObservableObject{
    @Published var pokemons: [Pokemon] = []
    @Published var pokemonsImage: [Int: UIImage] = [:]
    var currentPage = 0
    
    func updateList(search: String) async {
        // Get Pokemons Info
        let pokemonList = await PokeAPI.getAllPokemons(page: 1)
        self.pokemons = pokemonList.sorted(by: { $0.id < $1.id })
    }
    
    func nextPage() async {
        print("current: \(currentPage)")
        currentPage += 1
        let pokemonList = await PokeAPI.getAllPokemons(page: currentPage) + self.pokemons
        self.pokemons = pokemonList.sorted(by: { $0.id < $1.id })
    
        await getPokemonsImage()
    }
    
    func getPokemonsImage() async {
        do{
            try await withThrowingTaskGroup(of: (Int, Data).self, body: { group in
                for pokemon in self.pokemons {
                    if self.pokemonsImage[pokemon.id] == nil {
                        group.addTask {
                            return (pokemon.id, await PokeAPI.getImage(url: pokemon.sprites.frontURL!))
                        }
                    }
                }
                
                while let result = try await group.next() {
                    let (id, data) = result
                    let uiImage = UIImage(data: data)
                    self.pokemonsImage[id] = uiImage
                }
            })
        } catch {
            print(error)
        }
    }
}

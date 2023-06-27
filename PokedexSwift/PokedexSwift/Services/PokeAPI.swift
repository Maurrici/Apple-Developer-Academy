//
//  PokeApi.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 23/06/23.
//

import Foundation

struct PokemonListResponse: Decodable {
    let results: [InfoDefault]
}

class PokeAPI {
    static private var baseURL = "https://pokeapi.co/api/v2"
    
    static func getAllPokemons(page: Int) async -> [Pokemon] {
        let urlRequest = URLRequest(url: URL(string: "\(baseURL)/pokemon?offset=0&limit=10")!)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let body = try decoder.decode(PokemonListResponse.self, from: data)
            
            var pokemons: [Pokemon] = []
            
            for item in body.results{
                let pokemon = await PokeAPI.getPokemonByName(name: item.name)
                
                pokemons.append(pokemon)
            }

            return pokemons
            
        }catch{
            print(error)
        }
        
        return []
    }
    
    static func getPokemonByName(name: String) async -> Pokemon {
        let urlRequest = URLRequest(url: URL(string: "\(baseURL)/pokemon/\(name)")!)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let pokemon = try decoder.decode(Pokemon.self, from: data)
            
            return pokemon
            
        }catch{
            print(error)
        }
        
        return Pokemon()
    }
}

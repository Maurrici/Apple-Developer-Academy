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
        let size = 150
        let start = (page - 1) * size

        let urlRequest = URLRequest(url: URL(string: "\(baseURL)/pokemon?offset=\(start)&limit=\(size)")!)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let body = try decoder.decode(PokemonListResponse.self, from: data)
            
            var pokemons: [Pokemon] = []
            
            try await withThrowingTaskGroup(of: Pokemon.self) { group in
                for item in body.results{
                    group.addTask {
                        return await PokeAPI.getPokemonByName(name: item.name)
                    }
                }
                
                while let result = try await group.next(){
                    pokemons.append(result)
                }
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
    
    static func getImage(url: URL) async -> Data {
        let urlRequest = URLRequest(url: url)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return data
        } catch {
            print("Deu ruim!")
        }
        
        return Data()
    }
}

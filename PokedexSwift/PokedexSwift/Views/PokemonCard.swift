//
//  PokemonCard.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 26/06/23.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack{
            AsyncImage(url: pokemon.sprites.frontURL) { pokemonImage in
                pokemonImage.image?
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            
            HStack{
                Spacer()
                Text(pokemon.species.name.capitalized)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding()
        .background(.gray)
        .cornerRadius(16)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static private var pokemon = Pokemon(id: 1, sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"), types: [Types(type: InfoDefault(name: "grass", url: "https://pokeapi.co/api/v2/type/12/"))], species: InfoDefault(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"))
    
    static var previews: some View {
        PokemonCard(pokemon: pokemon)
    }
}

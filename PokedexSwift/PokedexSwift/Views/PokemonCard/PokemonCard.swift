//
//  PokemonCard.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 26/06/23.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    var image: UIImage
    
    var body: some View {
        VStack{
//            AsyncImage(url: pokemon.sprites.frontURL) { phase in
//                switch phase {
//                case .empty:
//                    ProgressView() // Exibido enquanto a imagem está sendo carregada
//                case .success(let image):
//                    image.resizable().scaledToFit() // Exibe a imagem carregada
//                case .failure(let error):
//                    Text("Failed to load image: \(error.localizedDescription)") // Exibe uma mensagem de erro caso a imagem não possa ser carregada
//                @unknown default:
//                    EmptyView()
//                }
//            }
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
            
            HStack{
                Spacer()
                Text("\(pokemon.species.name.capitalized) #\(pokemon.id)")
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.bold)
                Spacer()
            }
        }
        .padding()
        .background(Color(pokemon.types[0].type.name.capitalized))
        .cornerRadius(16)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static private var pokemon = Pokemon(id: 1, species: InfoDefault(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"), sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"), types: [Types(type: InfoDefault(name: "grass", url: "https://pokeapi.co/api/v2/type/12/"))])
    
    static var previews: some View {
        PokemonCard(pokemon: pokemon, image: UIImage())
    }
}

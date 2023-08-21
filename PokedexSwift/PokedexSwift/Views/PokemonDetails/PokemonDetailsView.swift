//
//  PokemonDetailsVIew.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 28/06/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    var pokemon: Pokemon
    var viewModel = PokemonDetailsViewModel()
    
    @State private var isFlipped = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            HStack{
                if isFlipped {
                    AsyncImage(url: pokemon.sprites.backURL){ pokemonImage in
                        pokemonImage.image?
                            .resizable()
                            .frame(width: 280, height: 280)
                    }
                } else {
                    AsyncImage(url: pokemon.sprites.frontURL){ pokemonImage in
                        pokemonImage.image?
                            .resizable()
                            .frame(width: 280, height: 280)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isFlipped.toggle()
                }
            }
            .background(Color(pokemon.types[0].type.name.capitalized))
            
            ScrollView{
                VStack{
                    Text(pokemon.species.name.capitalized)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack{
                        ForEach(pokemon.types, id: \.type.name){ item in
                            Text(item.type.name)
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(item.type.name.capitalized))
                                .cornerRadius(20)
                        }
                    }
                    .padding(.bottom)
                    
                    HStack{
                        Spacer()
                        VStack{
                            Text("\(pokemon.height.formatted())")
                            Text("Height")
                        }
                        Spacer()
                        VStack{
                            Text("\(pokemon.weight.formatted())")
                            Text("Weight")
                        }
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    VStack(spacing: 20){
                        ForEach(pokemon.stats, id: \.stat.name){ stat in
                            if(stat.stat.name != "special-attack" && stat.stat.name != "special-defense"){
                                StatView(
                                    name: viewModel.nameStat[stat.stat.name] ?? stat.stat.name,
                                    value: stat.baseStat,
                                    percent: viewModel.getPercentOfStat(stat: stat.stat.name, value: stat.baseStat))
                            }
                        }
                        
                        StatView(name: viewModel.nameStat["xp"] ?? "xp", value: pokemon.baseExperience, percent: viewModel.getPercentOfStat(stat: "xp", value: pokemon.baseExperience))
                    }
                    .frame(alignment: .top)
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack{
                        Image(systemName: "chevron.backward")
                        Text("Pokedex")
                    }
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.red.opacity(0.8))
                    .cornerRadius(8)
                }

            }
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static private var pokemon = Pokemon(id: 1, species: InfoDefault(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"), weight: 2.3, height: 1.4, baseExperience:23, stats: [Stats(baseStat: 40, stat: InfoDefault(name: "HP", url: "as"))], sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"), types: [Types(type: InfoDefault(name: "grass", url: "https://pokeapi.co/api/v2/type/12/"))])
    
    static var previews: some View {
        PokemonDetailsView(pokemon: pokemon)
    }
}

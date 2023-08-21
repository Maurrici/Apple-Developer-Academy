//
//  ContentView.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("Pokedex")
                    .font(.largeTitle)
                Spacer()
            }
            .padding(.vertical, 5)
            .background(.red)
            .foregroundColor(.white)
            
            Spacer()
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.pokemons, id: \.id) { pokemon in
                        NavigationLink{
                            PokemonDetailsView(pokemon: pokemon)
                        } label: {
                            PokemonCard(pokemon: pokemon, image: viewModel.pokemonsImage[pokemon.id] ?? UIImage())
                                .onAppear {
                                    Task {
                                        if pokemon.id == viewModel.pokemons.last?.id {
                                            await viewModel.nextPage()
                                        }
                                    }
                                }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .task {
            await viewModel.nextPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

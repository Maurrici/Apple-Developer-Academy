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
            // Title Bar
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
            
            // List
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.pokemons) { pokemon in
                        PokemonCard(pokemon: pokemon)
                    }
                }
                .padding(10)
            }
        }
        .background(.cyan)
        .task {
            await viewModel.updateList(search: "")
            print(viewModel.pokemons)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

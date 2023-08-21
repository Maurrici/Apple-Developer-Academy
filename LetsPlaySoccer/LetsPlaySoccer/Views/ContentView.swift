//
//  ContentView.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State var isAddPlayer = false
    
    let columns = [GridItem()]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns, alignment: .leading, spacing: 10){
                    ForEach(viewModel.players){ player in
                        HStack{
                            Image("Player")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            Text(player.name)
                            Spacer()
                        }
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(.black))
                        .onTapGesture {
                            viewModel.playerRepository.deletePetById(player.id)
                            viewModel.updatePlayers()
                        }
                    }
                }
                .padding(30)
                .onAppear {
                    viewModel.updatePlayers()
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isAddPlayer.toggle()
                    } label: {
                        HStack{
                            Text("Adicionar")
                            Label("Adicionar", systemImage: "plus")
                        }
                    }
                    .sheet(isPresented: $isAddPlayer) {
                        viewModel.updatePlayers()
                    } content: {
                        AddPlayerView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

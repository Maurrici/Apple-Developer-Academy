//
//  AddPlayerView.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import SwiftUI

struct AddPlayerView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var formViewModel = FormViewModel()
    @StateObject var addPlayerViewModel = AddPlayerViewModel()
    
    var body: some View {
        VStack{
            FormView()
                .environmentObject(formViewModel)
            
            CustomButton(
                buttonLabel: "Salvar",
                buttonAction: {
                    addPlayerViewModel.addPlayer(formViewModel.player)
                    dismiss()
                },
                buttonColor: "AddColor")
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}

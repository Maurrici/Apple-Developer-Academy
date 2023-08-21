//
//  FormView.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 07/06/23.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var viewModel: FormViewModel
    
    func renderLine() -> some View{
        Divider()
            .padding(EdgeInsets(top: 0, leading: -16, bottom: 0, trailing: -16))
            .offset(y: -2)
    }
    
    var body: some View {
        VStack{
            
            ImagePicker(currentImage: Binding<Data?>(
                get: { viewModel.player.image },
                set: { viewModel.player.image = $0 }
            ))
                .padding(.bottom, 36)
            
            Group{
                VStack{
                    InputText(placeholder: "Nome do jogador", value: $viewModel.player.name)
                        .foregroundColor(.black)
                    renderLine()
                    
                    // Esse componente está sendo produzido pelo Winni e deverá ser substituído
                    HStack{
                        Text("Idade")
                        
                        Spacer()
                        
                        Button {
                            viewModel.player.age += 1
                        } label: {
                            Text("\(viewModel.player.age) anos")
                                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                .background(.gray)
                                .cornerRadius(4)
                        }
                    }
                    // ----------------------------------------------
                    renderLine()
                    
                    InputPicker(label: "Posições", value: $viewModel.player.position, options: Position.allCases)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color("FieldBackgroundColor"))
            .foregroundColor(.black)
            .cornerRadius(16)
        }
        .padding(.horizontal)
    }
}

struct FormView_Previews: PreviewProvider {
    static private var viewModel = FormViewModel()
    
    static var previews: some View {
        FormView()
            .environmentObject(FormViewModel())
    }
}

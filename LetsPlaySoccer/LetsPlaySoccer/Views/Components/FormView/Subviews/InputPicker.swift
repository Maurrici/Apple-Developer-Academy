//
//  InputPicker.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct InputPicker<T>: View where T: Hashable {
    var label: String
    @Binding var value: T
    var options: [T]
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(.black)
            
            Spacer()
            Picker(label, selection: $value) {
                ForEach(options, id: \.self){ option in
                    buildOption(option)
                }
            }
            .tint(.gray)
        }
    }
    
    @ViewBuilder
    func buildOption(_ option: T) -> some View{
        if let boolValue = option as? Bool{
            if boolValue{
                Text("Sim").tag(true)
            }else{
                Text("Não").tag(false)
            }
        }else if let rawValue = (option as? (any RawRepresentable))?.rawValue as? String {
            Text(String(describing: rawValue))
        }else{
            Text(String(describing: option))
        }
    }
}

struct InputPicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InputPicker(label: "Gênero",value: .constant(""), options: ["Nenhum", "Macho", "Fêmea"])
            InputPicker(label: "Espécie",value: .constant(""), options: ["Não escolhida","Teste1", "Teste2", "Teste3"])
            InputPicker(label: "Raça",value: .constant(""), options: ["Não escolhida", "Teste1", "Teste2", "Teste3"])
            InputPicker(label: "Castrado",value: .constant(""), options: ["Não", "Sim"])
        }
    }
}

//
//  CustomButton.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import SwiftUI

struct CustomButton: View {
    
    var buttonLabel: String
    var buttonAction: () -> Void
    var buttonColor: String
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(buttonLabel)
                .foregroundColor(.white)
                .padding(EdgeInsets(top:15, leading: 0, bottom: 15, trailing: 0))
                .frame(width: 327)
                .background(Color(buttonColor))
                .cornerRadius(8)
                .contentShape(Rectangle())
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonLabel: "Excluir cadastro", buttonAction: { print("oi") },buttonColor: "DeleteButtonColor")
    }
}

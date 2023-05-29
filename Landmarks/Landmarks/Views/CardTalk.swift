//
//  CardTalk.swift
//  Landmarks
//
//  Created by userext on 18/05/23.
//

import SwiftUI

struct CardTalk: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Image(systemName: "dollarsign.circle.fill")
                .foregroundColor(.black)
                .padding(.bottom, 16)
            
            Text(title)
            Spacer()
            
            Text("Saldo")
                .foregroundColor(.gray)
            Text("R$ \(value)")
        }
        .padding(16)
        .background(Color("backgroundColor"))
        .cornerRadius(6)
        .foregroundColor(.white)
        
    }
}

struct CardTalk_Previews: PreviewProvider {
    static var previews: some View {
        CardTalk(title: "C", value: "135,50")
            .frame(width: 152, height: 200)
    }
}

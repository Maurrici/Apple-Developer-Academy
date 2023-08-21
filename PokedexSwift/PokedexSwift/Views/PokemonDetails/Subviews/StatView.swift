//
//  StatView.swift
//  PokedexSwift
//
//  Created by Maurício de Moura on 29/06/23.
//

import SwiftUI

struct StatView: View {
    var name: String
    var value: Int
    var percent: Double
    
    var body: some View {
        GeometryReader { geo in
            HStack{
                Text(name)
                    .frame(width: 50, alignment: .leading)
                Rectangle()
                    .foregroundColor(Color(name))
                    .frame(width: geo.size.width * percent - 0.1, height: 20)
                    .cornerRadius(4)
                Spacer()
                Text("\(value)")
            }
            .frame(height: 50)
            .padding(.horizontal, 5)
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(name: " HP", value: 200, percent: 0.6)
    }
}

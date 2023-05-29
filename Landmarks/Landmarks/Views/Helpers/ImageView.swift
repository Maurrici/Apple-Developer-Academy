//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by userext on 16/05/23.
//

import SwiftUI

struct ImageView: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 4))
            .shadow(radius: 8)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("campnou"))
    }
}

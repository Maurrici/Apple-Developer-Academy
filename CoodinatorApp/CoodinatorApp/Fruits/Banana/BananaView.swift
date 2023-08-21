//
//  BananaView.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 01/08/23.
//

import SwiftUI

struct BananaView: View {
    @ObservedObject var router: BananaRoute
    
    var body: some View {
        List {
            Button("Push 🥕") {
                router.push(to: .carrot)
            }
            
            Button("Pop") {
                router.pop()
            }
        }
        .navigationTitle("🍌")
    }
}

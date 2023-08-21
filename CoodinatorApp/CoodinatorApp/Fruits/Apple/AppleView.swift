//
//  AppleView.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 01/08/23.
//

import SwiftUI

struct AppleView: View {
    @ObservedObject var router: AppleRoute
    
    var handleTitle: String = "Teste"
    
    var body: some View {
        VStack{
            Text(handleTitle)
                .font(.title)
            
            List {
                Button("Push 🍌") {
                    router.push(to: .banana)
                }
                
                Button("Present 🍋") {
                    router.present(sheet: .lemon)
                }

                Button("Present 🫒") {
                    router.present(fullScreenCover: .olive)
                }
            }
            .navigationTitle("🍎")
        }
        .sheet(item: $router.sheet) { sheet in
            router.build(sheet: sheet)
        }
        .fullScreenCover(item: $router.fullScreenCover) { fullScreenCover in
            router.build(fullScreenCover: fullScreenCover)
        }
    }
}

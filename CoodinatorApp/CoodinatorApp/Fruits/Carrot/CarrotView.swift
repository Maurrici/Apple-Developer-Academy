//
//  CarrotView.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 01/08/23.
//

import SwiftUI

struct CarrotView: View {
    @ObservedObject var router: CarrotRoute
    
    var body: some View {
        List {
            Button("Pop") {
                router.pop()
            }
            
            Button("Pop to root") {
                router.popToRoot()
            }
        }
        .navigationTitle("🥕")
    }
}

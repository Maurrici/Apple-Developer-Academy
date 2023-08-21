//
//  LemonView.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 01/08/23.
//

import SwiftUI

struct LemonView: View {
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        List {
            Button("Dismiss") {
                dismiss()
            }
        }
        .navigationTitle("🍋")
    }
}

struct LemonView_Previews: PreviewProvider {
    static var previews: some View {
        LemonView()
    }
}

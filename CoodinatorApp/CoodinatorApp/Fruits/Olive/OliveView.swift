//
//  OliveView.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 01/08/23.
//

import SwiftUI

struct OliveView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            Button("Dismiss") {
                dismiss()
            }
        }
        .navigationTitle("🫒")
    }
}

struct OliveView_Previews: PreviewProvider {
    static var previews: some View {
        OliveView()
    }
}

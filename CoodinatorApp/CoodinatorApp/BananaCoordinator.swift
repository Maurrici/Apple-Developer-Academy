//
//  BananaCoordinator.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 16/08/23.
//

import Foundation
import SwiftUI

class BananaCoordinator: Coordinator {
    func buildAppleWithTitle(title: String) -> some View {
        return AppleView(handleTitle: title)
    }
}

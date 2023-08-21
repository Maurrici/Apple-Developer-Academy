//
//  FormViewModel.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 12/06/23.
//

import Foundation
import SwiftUI

class FormViewModel: ObservableObject {
    @Published var player: PlayerModel
    
    init(_ player: PlayerModel? = nil) {
        if let playerValue = player {
            self.player = playerValue
        }else{
            self.player = PlayerModel()
        }
    }
}



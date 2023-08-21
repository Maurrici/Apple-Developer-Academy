//
//  BananaRoute.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 18/08/23.
//

import SwiftUI

enum BananaPages {
    case carrot
    case apple
}

final class BananaRoute: Route {
    let id: UUID = .init()
    var coordinator: any CoordinatorB

    @Published var isPresentingInfo: Bool = false

    init(coordinator: any CoordinatorB) {
        self.coordinator = coordinator
    }

    func push(to page: BananaPages) {
        switch page {
        case .carrot:
            self.coordinator.push(CarrotRoute(coordinator: self.coordinator))
        case .apple:
            self.coordinator.push(AppleRoute(coordinator: self.coordinator))
        }
    }

    @ViewBuilder func build() -> some View {
        BananaView(router: self)
    }
}

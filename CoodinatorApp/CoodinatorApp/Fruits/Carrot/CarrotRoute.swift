//
//  CarrotRoute.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 18/08/23.
//

import SwiftUI

enum CarrotPages {
    case banana
}

final class CarrotRoute: Route {
    let id: UUID = .init()
    var coordinator: any CoordinatorB

    init(coordinator: any CoordinatorB) {
        self.coordinator = coordinator
    }

    func push(to page: CarrotPages) {
    }

    @ViewBuilder func build() -> some View {
        CarrotView(router: self)
    }
}

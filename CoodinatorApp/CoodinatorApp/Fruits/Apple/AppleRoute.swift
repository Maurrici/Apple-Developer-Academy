//
//  AppleRoute.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 18/08/23.
//

import SwiftUI

enum ApplePages {
    case banana
}

enum AppleSheet: String, Identifiable {
    case lemon
    
    var id: String {
        self.rawValue
    }
}

enum AppleFullScreenCover: String, Identifiable {
    case olive

    var id: String {
        self.rawValue
    }
}

final class AppleRoute: Route {
    let id: UUID = .init()
    var coordinator: any CoordinatorB

    @Published var sheet: AppleSheet? = nil
    @Published var fullScreenCover: AppleFullScreenCover? = nil

    init(coordinator: any CoordinatorB) {
        self.coordinator = coordinator
    }

    func push(to page: ApplePages) {
        switch page {
        case .banana:
            self.coordinator.push(BananaRoute(coordinator: self.coordinator))
        }
    }
    
    func present(sheet: AppleSheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: AppleFullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }

    @ViewBuilder func build() -> some View {
        AppleView(router: self)
        .navigationDestination(for: BananaRoute.self) { route in
            route.build()
        }
    }
    
    @ViewBuilder func build(sheet: AppleSheet) -> some View {
        switch sheet {
        case .lemon:
            LemonView()
        }
    }
    
    @ViewBuilder func build(fullScreenCover: AppleFullScreenCover) -> some View {
        switch fullScreenCover {
        case .olive:
            OliveView()
        }
    }
}

//
//  Coordinator.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 01/08/23.
//

import SwiftUI

class AppCoordinator: CoordinatorB {
    let id: UUID = .init()

    @Published var path: NavigationPath
    @Published var sheet: Bool
    var isLoggedIn: Bool

    init(path: NavigationPath = .init(), isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
        self.path = path
        self.sheet = false
    }

    func push<R: Route>(_ route: R) {
        self.path.append(route)
    }

    func pop() {
        self.path.removeLast()
    }
    
    func popToRoot() {
        self.path.removeLast(path.count)
    }

    @ViewBuilder func build() -> some View {
        buildApple()
    }

    private func buildApple() -> some View {
        AppleRoute(coordinator: self).build()
    }
}

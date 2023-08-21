//
//  Coordinator.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 18/08/23.
//

import SwiftUI

protocol CoordinatorB: FlowBuilder {
    var id: UUID { get }
    var path: NavigationPath { get set }

    func push<R: Route>(_ route: R)
    func pop()
    func popToRoot()
}

extension CoordinatorB {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.path == rhs.path &&
        lhs.id == rhs.id
    }
}


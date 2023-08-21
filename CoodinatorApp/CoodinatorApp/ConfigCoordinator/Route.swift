//
//  Route.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 18/08/23.
//

import Foundation

protocol Route: FlowBuilder {
    associatedtype Pages
    
    var id: UUID { get }
    var coordinator: any CoordinatorB { get }

    func push(to page: Pages)
}

extension Route {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    func pop() {
        coordinator.pop()
    }
    
    func popToRoot() {
        coordinator.popToRoot()
    }
}

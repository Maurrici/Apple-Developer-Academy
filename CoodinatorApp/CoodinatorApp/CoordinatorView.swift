//
//  CoordinatorView.swift
//  CoodinatorApp
//
//  Created by Maurício de Moura on 01/08/23.
//

import SwiftUI

//struct CoordinatorView: View {
//
//    @StateObject private var coordinator = AppCoordinator(isLoggedIn: true)
//
//    var body: some View {
//        NavigationStack(path: $coordinator.path) {
//            coordinator.build(page: .apple)
//                .navigationDestination(for: Page.self) { page in
//                    coordinator.build(page: page)
//                }
//                .sheet(item: $coordinator.sheet) { sheet in
//                    coordinator.build(sheet: sheet)
//                }
//                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
//                    coordinator.build(fullScreenCover: fullScreenCover)
//                }
//        }
//
//    }
//}
struct CoordinatorView: View {
    
    @StateObject private var coordinator = AppCoordinator(isLoggedIn: true)
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build()
                .navigationDestination(for: CarrotRoute.self) { route in
                    route.build()
                }
        }
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}

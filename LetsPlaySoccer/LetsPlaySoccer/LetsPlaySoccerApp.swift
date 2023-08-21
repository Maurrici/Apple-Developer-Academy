//
//  LetsPlaySoccerApp.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import SwiftUI

@main
struct LetsPlaySoccerApp: App {
    let persistanceController = PersistanceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceController.container.viewContext)
        }
    }
}

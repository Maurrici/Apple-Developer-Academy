//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by Maurício de Moura on 13/06/23.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    
    let persistanceController = PersistanceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
            }
            .environment(\.managedObjectContext, persistanceController.container.viewContext)
        }
    }
}

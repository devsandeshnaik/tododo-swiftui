//
//  tododoApp.swift
//  tododo
//
//  Created by Sandesh Naik on 28/01/25.
//

import SwiftUI

@main
struct tododoApp: App {
    
    // App enviroments
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}

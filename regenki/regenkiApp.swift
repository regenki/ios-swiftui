//
//  regenkiApp.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 22/09/21.
//

import SwiftUI

@main
struct regenkiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AddActivitySheet()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) 
        }
    }
}

//
//  SampleProject_SwiftUIApp.swift
//  SampleProject-SwiftUI
//
//  Created by Denis Svichkarev on 20.09.2024.
//

import SwiftUI

@main
struct SampleProject_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

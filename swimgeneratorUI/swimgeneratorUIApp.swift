//
//  swimgeneratorUIApp.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 9/27/24.
//

import SwiftUI
import SwiftData

@main
struct swimgeneratorUIApp: App {
    var network = Network()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Stroke.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
        .modelContainer(sharedModelContainer)
    }
}

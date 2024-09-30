//
//  swimgeneratorUIApp.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 9/27/24.
//

import SwiftUI

@main
struct swimgeneratorUIApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(network)
        }
    }
}

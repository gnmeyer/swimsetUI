//
//  StrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI
import SwiftData

struct StrokeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var strokes: [Stroke]
    
    var body: some View {
        NavigationStack {
            VStack { // Use VStack to stack multiple NavigationLinks vertically
                NavigationLink(destination: CreateStrokeView()) {
                    Text("Create Stroke")
                }
                NavigationLink(destination: DisplayStrokeView()) {
                    Text("Display Strokes")
                }
            }
            .navigationTitle("Stroke Menu") // Optional: Add a title to the navigation bar
        }
    }
}

struct StrokeView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeView()
            .modelContainer(for: [Stroke.self])
    }
}

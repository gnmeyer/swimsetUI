//
//  WorkoutsView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/24/24.
//

import SwiftUI
import SwiftData

struct WorkoutsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [Workout]
    
    var body: some View {
        NavigationStack {
            VStack { // Use VStack to stack multiple NavigationLinks vertically
                NavigationLink(destination: CreateWorkoutView()) {
                    Text("Create Workout")
                }
                NavigationLink(destination: DisplayWorkoutsView()) {
                    Text("Display Workouts")
                }
            }
            .navigationTitle("Workout Menu") // Optional: Add a title to the navigation bar
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .modelContainer(for: [Workout.self])
    }
}

//
//  HomePage.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var swimsets: [SwimSet]
    @Query private var strokes: [Stroke]
    var body: some View {
            NavigationStack {
                VStack {
                    NavigationLink(destination: StrokeView()) {
                        Text("Strokes")
                    }
                    NavigationLink(destination: SwimSetView()) {
                        Text("Sets")
                    }
                    NavigationLink(destination: WorkoutsView()) {
                        Text("Workouts")
                    }
                }
                .navigationTitle("Home Menu")
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .modelContainer(for: [SwimSet.self])
            .modelContainer(for: [Stroke.self])
    }
}

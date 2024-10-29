//
//  DisplayWorkouts.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/24/24.
//

import SwiftUI
import SwiftData

struct DisplayWorkoutsView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var workouts: [Workout]
    @Query private var swimsets: [SwimSet]

    var body: some View {
        NavigationStack {
            List {
                ForEach(workouts) { workout in
                    NavigationLink {
                        VStack {
                            Text("Set Title: \(workout.title)")
                            Text("Distance: \(workout.distance)")

                        }
                    } label: {
                        Text("\(workout.title)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
//        } detail: {
//            Text("Select an item")
//        }
    }

    private func addItem() {
        withAnimation {
//            let newStroke = Stroke(title: "test", desc: "test")
//            modelContext.insert(newStroke)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(workouts[index])
            }
        }
    }
}

struct DisplayWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayWorkoutsView()
            .modelContainer(for: [Workout.self])
    }
}

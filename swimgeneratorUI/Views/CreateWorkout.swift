//
//  CreateWorkout.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/24/24.
//

import SwiftUI
import SwiftData

struct CreateWorkoutView: View {

    @Environment(\.modelContext) private var modelContext
    
    @State private var WorkoutTitle = ""
    @State private var distance = 2000.0
    @State private var isEditing = false
    @State private var selectedSwimSets: [SwimSet] = []
    
    @Query private var workouts: [Workout]
    @Query private var swimsets: [SwimSet]
    
    var body: some View {
        VStack {
            Text("Hello")
            Form {
                TextField("Set Title", text: $WorkoutTitle)
                VStack {
                    Text("Distance \(Int(distance))")
                    Slider(
                        value: $distance,
                        in: 0...2000.0,
                        step: 25
                    ) {
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("2000")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                }
                
                // Multi-selection of SwimSets
                Text("Select Swim Sets")
                List(swimsets, id: \.self) { swimSet in
                    MultipleSelectionRow(swimSet: swimSet, isSelected: self.selectedSwimSets.contains(swimSet)) {
                        if self.selectedSwimSets.contains(swimSet) {
                            self.selectedSwimSets.removeAll(where: { $0 == swimSet })
                        } else {
                            self.selectedSwimSets.append(swimSet)
                        }
                    }
                }
                
                Button("Submit", action: {
                    let newWorkout = Workout(title: WorkoutTitle, distance: Int(distance))
                    
                    modelContext.insert(newWorkout)
                    
                    newWorkout.swimSets = selectedSwimSets

                    print("Workout created: Title: \(newWorkout.title)")
                    //Insert telemetry here
                    do {
                        try modelContext.save() // Save the context to persist the data
                        print("Workout saved: \(newWorkout.title)")
                    } catch {
                        print("Error saving stroke: \(error)")
                    }
                    WorkoutTitle = ""
                })
            }
            List {
                ForEach(workouts) { workout in
                    Text(workout.title)
                }
            }
        }
    }
}


struct MultipleSelectionRow: View {
    var swimSet: SwimSet
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(swimSet.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}


struct CreateWorkout_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutView()
            .modelContainer(for: [Workout.self])
            .modelContainer(for: [SwimSet.self])
    }
}

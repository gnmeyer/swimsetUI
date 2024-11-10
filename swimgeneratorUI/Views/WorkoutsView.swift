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
        ZStack {
            Color.black.opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                headerView()
                
                NavigationStack {
                    workoutListView()
                    createWorkoutButton()
                }
                .padding(.horizontal)
            }
        }
    }

    private func headerView() -> some View {
        Text("Workouts Menu")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding(.top, 20)
    }

    private func workoutListView() -> some View {
        List {
            ForEach(workouts) { workout in
                NavigationLink {
                    WorkoutDetailView(workout: workout)
                } label: {
                    WorkoutRowView(workout: workout)
                }
            }
            .onDelete(perform: deleteItems)
            .listRowBackground(Color.clear)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .foregroundColor(.white)
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }

    private func createWorkoutButton() -> some View {
        NavigationLink(destination: CreateWorkoutView()) {
            HStack {
                Text("➕")
                Text("Create Workout")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.green.opacity(0.7))
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .padding(.horizontal)
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(workouts[index])
            }
        }
    }
}

struct WorkoutDetailView: View {
    let workout: Workout

    var body: some View {
        Text("\(workout.title)")
            .padding()
            .font(.title2)
            .foregroundColor(.white)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
    }
}

struct WorkoutRowView: View {
    let workout: Workout

    var body: some View {
        HStack {
            Text("🏊‍♂️")
            Text(workout.title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

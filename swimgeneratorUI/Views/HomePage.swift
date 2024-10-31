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
            ZStack {
                Color.black.opacity(0.9) // Dark background
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) { // Spacing between each navigation link
                    Spacer()
                    // "Strokes" Navigation Link with Icon and Large Font
                    NavigationLink(destination: StrokeView()) {
                        HStack {
                            Text("🏊‍♂️") // Swim stroke emoji
                            Text("Strokes")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                        }
                        .frame(maxWidth: .infinity) // Makes the link take full width
                        .foregroundColor(.white)
                        .background(Color.blue.opacity(0.7)) // Button-like background
                        .cornerRadius(15)
                    }
                    
                    // "Sets" Navigation Link with Icon and Large Font
                    NavigationLink(destination: SwimSetView()) {
                        HStack {
                            Text("📋") // Note/clipboard emoji
                            Text("Sets")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(15)
                    }
                    
                    // "Workouts" Navigation Link with Icon and Large Font
                    NavigationLink(destination: WorkoutsView()) {
                        HStack {
                            Text("🏋️‍♂️") // Weightlifting emoji
                            Text("Workouts")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.orange.opacity(0.7))
                        .cornerRadius(15)
                    }
                }
                .padding()
                .navigationTitle("Swim Workouts")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Swim Workouts")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .modelContainer(
                for: [SwimSet.self, Stroke.self, Workout.self])
        

    }
}

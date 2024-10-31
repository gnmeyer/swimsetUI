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
            ZStack {
                Color.black.opacity(0.9) // Dark background
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    
                    Text("Stroke Menu")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    NavigationStack {
                        List {
                            ForEach(strokes) { stroke in
                                NavigationLink {
                                    Text("\(stroke.desc)")
                                        .padding()
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(10)
                                } label: {
                                    HStack {
                                        Text("🏊‍♂️")
                                        Text(stroke.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                }
                            }
                            .onDelete(perform: deleteItems)
                            .listRowBackground(Color.clear) // Transparent background for rows
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                EditButton()
                                    .foregroundColor(.white)
                            }
                        }
                        .scrollContentBackground(.hidden) // Removes default form background
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    }

                    // "Create Strokes" Button at Bottom
                    NavigationLink(destination: CreateStrokeView()) {
                        HStack {
                            Text("➕")
                            Text("Create Strokes")
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
            }
        }
    private func addItem() {
        withAnimation {
            let newStroke = Stroke(title: "test", desc: "test")
            modelContext.insert(newStroke)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(strokes[index])
            }
        }
    }
}

struct StrokeView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

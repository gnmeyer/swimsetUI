//
//  DisplayStrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/20/24.
//

import SwiftUI
import SwiftData

struct DisplaySwimSetsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var swimsets: [SwimSet]

    var body: some View {
        NavigationStack {
            List {
                ForEach(swimsets) { swimset in
                    NavigationLink {
                        VStack {
                            Text("Set Title: \(swimset.title)")
                            Text("Distance: \(swimset.distance)")
                            Text("Rest: \(swimset.rest)")
                            Text("Reps: \(swimset.reps)")
                            ForEach(swimset.strokes, id: \.self) { stroke in
                                Text("\(stroke.title)")
                                    .padding()
                                    .background(.yellow)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                            }
                        }
                    } label: {
                        Text("\(swimset.title)")
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
                modelContext.delete(swimsets[index])
            }
        }
    }
}

struct DisplaySwimSetsView_Previews: PreviewProvider {
    static var previews: some View {
        DisplaySwimSetsView()
            .modelContainer(for: [SwimSet.self])
    }
}

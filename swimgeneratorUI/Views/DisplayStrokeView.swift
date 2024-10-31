//
//  DisplayStrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/20/24.
//

import SwiftUI
import SwiftData

struct DisplayStrokeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var strokes: [Stroke]

    var body: some View {
        NavigationStack {
            List {
                ForEach(strokes) { stroke in
                    NavigationLink {
                        Text("\(stroke.desc)")
                    } label: {
                        Text("\(stroke.title)")
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

struct DisplayStrokeView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayStrokeView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

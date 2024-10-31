//
//  CreateStrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI
import SwiftData

struct CreateStrokeView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var StrokeTitle = ""
    @State private var StrokeDescription = ""
    
    @Query private var strokes: [Stroke]
    
    var body: some View {
        VStack {
            Form {
                Text("Create a New Stroke")
                TextField("Stroke Name", text: $StrokeTitle)
                TextField("Stroke Description", text: $StrokeDescription)
                Button("Submit", action: {
                    let newStroke = Stroke(title: StrokeTitle, desc: StrokeDescription)
                    modelContext.insert(newStroke)
                    print("Stroke created: Title: \(newStroke.title)")
                    //Insert telemetry here
                    do {
                        try modelContext.save() // Save the context to persist the data
                        print("Stroke saved: \(newStroke.title)")
                    } catch {
                        print("Error saving stroke: \(error)")
                    }
                    StrokeTitle = ""
                    StrokeDescription = ""
                })
            }
//            List {
//                ForEach(strokes) { stroke in
//                    Text(stroke.title)
//                }
//            }
        }
    }
    
}



struct CreateStrokeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateStrokeView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

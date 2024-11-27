//
//  CreateStrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI
import SwiftData

struct CreateStrokeView: View {
    
    private let tracer = TraceManager.shared.tracer

    @Environment(\.modelContext) var modelContext
    
    @State  var StrokeTitle = ""
    @State  var StrokeDescription = ""
    
    @Query  var strokes: [Stroke]
    
    var body: some View {
        VStack {
            Form {
                Text("Create a New Stroke")
                TextField("Stroke Name", text: $StrokeTitle)
                TextField("Stroke Description", text: $StrokeDescription)
                Button("Submit", action: submitStroke)
            }
        }
    }
    
     func submitStroke() {
        let span = tracer.spanBuilder(spanName: "/createStrokes").setSpanKind(spanKind: .client).startSpan()

        let newStroke = Stroke(title: StrokeTitle, desc: StrokeDescription)
        modelContext.insert(newStroke)
        print("Stroke created: Title: \(newStroke.title)")

        do {
            try modelContext.save() // Save the context to persist the data
            print("Stroke saved: \(newStroke.title)")
            StrokeTitle = ""
            StrokeDescription = ""
        } catch {
            print("Error saving stroke: \(error)")
        }
        span.setAttribute(key: "stroke_name", value: newStroke.title);
        span.end()
    }
}



struct CreateStrokeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateStrokeView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

//
//  CreateStrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI
import SwiftData

struct CreateSwimSet: View {

    private let tracer = TraceManager.shared.tracer

    @Environment(\.modelContext) private var modelContext
    
    @State private var SwimSetTitle = ""
    @State private var distance = 2000.0
    @State private var rest = 120.0
    @State private var reps = 10.0
    @State private var isEditing = false
    
    @State private var selectedStrokes: [Stroke] = []
    
    @Query private var swimsets: [SwimSet]
    @Query private var strokes: [Stroke]
    
    var body: some View {
        VStack {
            Text("Swim Sets")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 20)
            Form {
                TextField("Set Title", text: $SwimSetTitle)
                VStack {
                    // Multi-selection of SwimSets
                    Text("Select Distance")
                    

                    Text("Rest \(Int(rest))")
                    Slider(
                        value: $rest,
                        in: 0...120,
                        step: 1
                    ) {
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("120")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                    Text("Reps \(Int(reps))")
                    Slider(
                        value: $reps,
                        in: 0...10,
                        step: 1
                    ) {
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("10")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                }
                
                // Multi-selection of SwimSets
                Text("Select Strokes Sets")
                List(strokes, id: \.self) { stroke in
                    StrokeMultipleSelectionRow(strokes: stroke, isSelected: self.selectedStrokes.contains(stroke)) {
                        if self.selectedStrokes.contains(stroke) {
                            self.selectedStrokes.removeAll(where: { $0 == stroke })
                        } else {
                            self.selectedStrokes.append(stroke)
                        }
                    }
                }
                
                Button("Submit", action: {
                    let newSwimSet = SwimSet(title: SwimSetTitle, distance: Int(distance), rest: Int(rest), reps: Int(reps))
                    
                    newSwimSet.strokes = selectedStrokes
                    modelContext.insert(newSwimSet)
                    print("SwimSet created: Title: \(newSwimSet.title)")
                    //Insert telemetry here
                    let span = tracer.spanBuilder(spanName: "/createSwimStroke").setSpanKind(spanKind: .client).startSpan()

                    do {
                        try modelContext.save() // Save the context to persist the data
                        span.setAttribute(key: "swimset_name", value: newSwimSet.title);
                        print("SwimSet saved: \(newSwimSet.title)")
                    } catch {
                        print("Error saving stroke: \(error)")
                    }
                    span.end()
                    SwimSetTitle = ""
                })
            }
            
        }

    }
    

}

struct DistanceSelectionButton: View {
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text("strokes.title")
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct StrokeMultipleSelectionRow: View {
    var strokes: Stroke
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(strokes.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct CreateSwimSetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSwimSet()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

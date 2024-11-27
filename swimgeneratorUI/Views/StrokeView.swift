//
//  StrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI
import SwiftData

import OpenTelemetryApi
import OpenTelemetrySdk
import StdoutExporter
import ResourceExtension
import OpenTelemetryProtocolExporterHttp
import JaegerExporter


struct StrokeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var strokes: [Stroke]

    private let tracer = TraceManager.shared.tracer
    
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
                            .listRowBackground(Color.clear) 
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
            print("New stroke inserted: \(newStroke)")
        }

    }

    private func deleteItems(offsets: IndexSet) {
    
        let span = tracer.spanBuilder(spanName: "/deleteStrokes").setSpanKind(spanKind: .client).startSpan()
        withAnimation {
            for index in offsets {
                span.setAttribute(key: "stroke_name", value: strokes[index].title);
                modelContext.delete(strokes[index])
            }
        }
        
        span.end()
        
    }
}

struct StrokeView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

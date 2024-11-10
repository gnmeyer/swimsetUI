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
//import ResourceExtension
import OpenTelemetryProtocolExporterHttp


class TraceManager {
    static let shared = TraceManager()
    
    init() {
        
        let url = URL(string: "http://localhost:4318")
        let otlpHttpTraceExporter = OtlpHttpTraceExporter(endpoint: url!)

        let spanExporter = StdoutSpanExporter(isDebug: true)
        let spanProcessor = SimpleSpanProcessor(spanExporter: spanExporter)

        
        // Specify the application name and the hostname.
        let resource = Resource(attributes: [
            ResourceAttributes.serviceName.rawValue: AttributeValue.string("<your-service-name>"),
            ResourceAttributes.hostName.rawValue: AttributeValue.string("<your-host-name>")
        ])

        // Configure the TracerProvider.
        OpenTelemetry.registerTracerProvider(tracerProvider: TracerProviderBuilder()
                                             .add(spanProcessor: BatchSpanProcessor(spanExporter: otlpHttpTraceExporter)) // Report data to Managed Service for OpenTelemetry.
                                             .with(resource: resource)
                                             .build())
        
//        OpenTelemetry.registerTracerProvider(tracerProvider: TracerProviderBuilder().add(spanProcessor: spanProcessor).with(resource: resource).build())
        
        print("TraceManager initialized with LoggingSpanExporter")

    }
}

struct StrokeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var strokes: [Stroke]

    let tracer = OpenTelemetry.instance.tracerProvider.get(instrumentationName: "YourInstrumentationName", instrumentationVersion: "1.0")
    
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
        print("addItem called")
        let span = tracer.spanBuilder(spanName: "GET /rolldice").setSpanKind(spanKind: .client).startSpan()
        print("Span started: \(span)")
        withAnimation {
            let newStroke = Stroke(title: "test", desc: "test")
            modelContext.insert(newStroke)
            print("New stroke inserted: \(newStroke)")
        }
        span.end()
        print("Span ended: \(span)")
    }

    private func deleteItems(offsets: IndexSet) {
        let span = tracer.spanBuilder(spanName: "Delete").setSpanKind(spanKind: .client).startSpan()
        span.end()
        print("test delete")
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

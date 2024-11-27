//
//  TraceManager.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 11/10/24.
//

import GRPC
import OpenTelemetryApi
import OpenTelemetrySdk
import StdoutExporter
import ResourceExtension
import OpenTelemetryProtocolExporterHttp
import JaegerExporter
import Foundation
import NIO

class TraceManager {
    static let shared = TraceManager()
    
    let tracer: TracerSdk
    
    private init() {
        let instrumentationScopeName = "SimpleExporter"
        let instrumentationScopeVersion = "semver:0.1.0"
//        let customEndpoint = URL(string: "http://localhost:4318")!
        
        let stdoutExporter = StdoutSpanExporter(isDebug: true)
        let jaegerExporter = JaegerSpanExporter(serviceName: "SimpleExporter", collectorAddress: "localhost")
        let otlpHttpTraceExporter = OtlpHttpTraceExporter()
        

        //http, stdout exporter
        let spanExporter = MultiSpanExporter(spanExporters: [otlpHttpTraceExporter, stdoutExporter])
        
        let spanProcessor = SimpleSpanProcessor(spanExporter: spanExporter)
        
        
        let resources = DefaultResources().get()
        
        OpenTelemetry.registerTracerProvider(tracerProvider:
            TracerProviderBuilder()
                .add(spanProcessor: spanProcessor)
                .with(resource: resources)
                .build()
        )
        
        self.tracer = OpenTelemetry.instance.tracerProvider.get(instrumentationName: instrumentationScopeName, instrumentationVersion: instrumentationScopeVersion) as! TracerSdk
    }
}

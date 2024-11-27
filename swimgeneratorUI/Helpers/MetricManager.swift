//
//  MetricManager.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 11/22/24.
//

//import OpenTelemetryApi
//import OpenTelemetrySdk
//import StdoutExporter
//import ResourceExtension
////import StableOtlpHTTPMetricExporter
//import Foundation
//
//class MetricManager {
//    
//    let metric: MetricProducer
//
//    private init() {
//        let instrumentationScopeName = "MetricExporter"
//        let instrumentationScopeVersion = "semver:0.1.0"
//        
//        let stdoutExporter = StdoutSpanExporter(isDebug: true)
////        let otlpHttpTraceExporter = StableOtlpHTTPMetricExporter()
//        
//        let metricExporter = MultiSpanExporter(spanExporters: [otlpHttpTraceExporter, stdoutExporter])
//    }
//}

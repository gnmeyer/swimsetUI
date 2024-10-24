//
//  StartView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//
import SwiftUI

struct StartView: View {
//    @EnvironmentObject var network: Network
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home View")
                NavigationView {
                    NavigationLink(destination: CreateSwimSet()) {
                        Text("Create Stroke")
                    }
                    NavigationLink(destination: DisplayStrokeView()) {
                        Text("Display Strokes")
                    }
                }
            }
        
        }
        
        
    }

    
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
//            .environmentObject(Network())
    }
}

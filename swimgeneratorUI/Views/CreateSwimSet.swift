//
//  CreateStrokeView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI

struct CreateSwimSet: View {
    
    @State private var SwimSetTitle = ""
    @State private var distance = 2000.0
    @State private var rest = 5.0
    @State private var reps = 10.0
    @State private var isEditing = false
    
    var body: some View {
        Form {
            Text("Hello")
            TextField("Set Title", text: $SwimSetTitle)
            VStack {
                Text("Distance \(Int(distance))")
                Slider(
                    value: $distance,
                    in: 0...2000.0,
                    step: 25
                ) {
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("10")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("Rest \(Int(rest))")
                Slider(
                    value: $rest,
                    in: 0...5,
                    step: 1
                ) {
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("5")
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
            Button("Submit", action: {
                
            })
        }
        
        

    }
    

}


struct CreateSwimSetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSwimSet()
    }
}

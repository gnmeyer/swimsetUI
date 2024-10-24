//
//  SwimSetView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/19/24.
//

import SwiftUI

struct SwimSetView: View {
    var body: some View {
        VStack {
            Text("Stroke View")
            NavigationView {
                NavigationLink(destination: CreateSwimSet()) {
                    Text("Create Swim Set")
                }
            }
        }
    }
    

}


struct SwimSetView_Previews: PreviewProvider {
    static var previews: some View {
        SwimSetView()
    }
}

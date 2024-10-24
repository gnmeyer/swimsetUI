//
//  HomePage.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/17/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
            NavigationStack {
                VStack {
                    NavigationLink(destination: StrokeView()) {
                        Text("Strokes")
                    }
                    NavigationLink(destination: SwimSetView()) {
                        Text("Sets")
                    }
                }
                .navigationTitle("Home Menu")
            }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  SwimSetView.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/19/24.
//

import SwiftUI
import SwiftData


struct SwimSetView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var swimsets: [SwimSet]
    var body: some View {
        VStack {
            NavigationStack{
                NavigationLink(destination: CreateSwimSet()) {
                    Text("Create Swim Set")
                }
                NavigationLink(destination: DisplaySwimSetsView()) {
                    Text("Display Swim Set")
                }
            }
        }
    }
    

}


struct SwimSetView_Previews: PreviewProvider {
    static var previews: some View {
        SwimSetView()
            .modelContainer(for: [SwimSet.self])
    }
}

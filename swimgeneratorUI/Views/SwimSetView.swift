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
        ZStack {
            Color.black.opacity(0.9) // Dark background
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Swim Set Menu")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.top, 20)
            }
            
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(swimsets[index])
            }
        }
    }
}


struct SwimSetView_Previews: PreviewProvider {
    static var previews: some View {
        SwimSetView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

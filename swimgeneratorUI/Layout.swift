////
////  Layout.swift
////  swimgeneratorUI
////
////  Created by Grant Meyer on 10/9/24.
////
//
//import SwiftUI
//
//struct SwimSetView: View {
//
//    @EnvironmentObject var network: Network
//    @State private var visibility: NavigationSplitViewVisibility = .all
//    
//    var body: some View {
//        NavigationSplitView(columnVisibility: $visibility) {
//            List {
//                NavigationLink("Category ", destination: CategoryView(category: "Category 1"))
//                NavigationLink("Category 2", destination: CategoryView(category: "Category 2"))
//            }
//            .navigationTitle("Sidebar")
//        } content: {
//            ContentUnavailableView("Select an element from the sidebar", systemImage: "doc.text.image.fill")
//        } detail: {
//            ContentUnavailableView("Select an element from the list", systemImage: "doc.text.image.fill")
//        }
//    }
//}
//
//struct SwimSetDetailView: View {
//    let swimset: SwimSet // Assuming you have a SwimSet model
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(swimset.title)
//                .font(.title)
//                .bold()
//            Text("Distance: \(swimset.distance) yards")
//            Text("Reps: \(swimset.reps)")
//            Text("Rest: \(swimset.rest)s")
//        }
//        .navigationTitle(swimset.title)
//        .padding()
//    }
//}
//
//struct CategoryView: View {
//    let category: String
//
//    var body: some View {
//        List {
//            NavigationLink("\\(category) Item 1", destination: DetailView(item: "\\(category) Item 1"))
//            NavigationLink("\\(category) Item 2", destination: DetailView(item: "\\(category) Item 2"))
//        }
//        .navigationTitle("Content")
//    }
//}
//
//struct DetailView: View {
//    let item: String
//
//    var body: some View {
//        Text("Details for \\(item)")
//            .navigationTitle("Detail")
//    }
//}
//
//#Preview {
////    @Previewable @EnvironmentObject var network: Network
//    SwimSetView()
//}
//

import SwiftUI
import SwiftData

struct SwimSetView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var swimsets: [SwimSet]
    
    private let tracer = TraceManager.shared.tracer

    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                headerView()
                
                NavigationStack {
                    swimsetListView()
                    createSwimSetButton()
                }
                .padding(.horizontal)
            }
        }
    }

    private func headerView() -> some View {
        Text("Swim Set Menu")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding(.top, 20)
    }

    private func swimsetListView() -> some View {
        List {
            ForEach(swimsets) { swimset in
                NavigationLink {
                    SwimSetDetailView(swimset: swimset)
                } label: {
                    SwimSetRowView(swimset: swimset)
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
        .scrollContentBackground(.hidden)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }

    private func createSwimSetButton() -> some View {
        NavigationLink(destination: CreateSwimSet()) {
            HStack {
                Text("➕")
                Text("Create SwimSet")
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

    private func deleteItems(offsets: IndexSet) {
        let span = tracer.spanBuilder(spanName: "/deleteSwimStroke").setSpanKind(spanKind: .client).startSpan()
        withAnimation {
            for index in offsets {
                span.setAttribute(key: "swimset_name", value: swimsets[index].title);
                modelContext.delete(swimsets[index])
            }
        }
        span.end()
    }
}

struct SwimSetDetailView: View {
    let swimset: SwimSet

    var body: some View {
        Text("\(swimset.title)")
            .padding()
            .font(.title2)
            .foregroundColor(.white)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
    }
}

struct SwimSetRowView: View {
    let swimset: SwimSet

    var body: some View {
        HStack {
            Text("🏊‍♂️")
            Text(swimset.title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct SwimSetView_Previews: PreviewProvider {
    static var previews: some View {
        SwimSetView()
            .modelContainer(for: [SwimSet.self, Stroke.self, Workout.self])
    }
}

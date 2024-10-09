import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var network: Network
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: NewWorkoutView()) {
                    Text("New Workout")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink(destination: WorkoutsView()) {
                    Text("Workouts")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink(destination: SwimSetsView()) {
                    Text("Sets")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .navigationTitle("Swim Generator")
                NavigationLink(destination: StrokeView()) {
                    Text("Strokes")
                        .font(.headline)
                        .padding()
                        .background(Color.blue) // Button background color
                        .foregroundColor(.white) // Text color inside the button
                        .cornerRadius(8) // Rounded corners
                }
                .navigationTitle("Swim Generator")
                
            }
        }
    }

    
}

struct WorkoutsView: View {
    @EnvironmentObject var network: Network
    var body: some View {
        VStack {
            ScrollView {
                Text("All Workouts")
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading) {
    
                    ForEach(network.workouts) { workout in
                        HStack(alignment:.top) {
                            Text(workout.title)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(workout.distance) yards")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button("Sign In", systemImage: "doc.text", action: Void)
                                .labelStyle(.iconOnly)
                            
                        }
                        .frame(width: 230, alignment: .leading)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                        .cornerRadius(10)
                    }
                    
                }

            }
            .padding(.vertical)
            .onAppear {
                network.getWorkouts()
                network.getSwimSets()
            }
            
            Button("Swim Sets", systemImage: "doc.text", action: Void)
                
            
        }
    }
}

struct SwimSetsView: View {
    @EnvironmentObject var network: Network
    var body: some View {
        ScrollView {
            Text("Swim Sets")
                .font(.title)
                .bold()
            VStack(alignment: .trailing) {
                VStack() {
                    ForEach(network.swimsets) { swimset in
                        HStack() {
                            Text(swimset.title)
                                .bold()
                            Text("\(swimset.distance) yards")
                            Text("x\(swimset.reps)")
                            Text("\(swimset.rest)s rest")
                        }
                        VStack() {
                            Text("test")
                        }
                    }
                }
                .frame(width: 230, alignment: .leading)
                .padding()
                .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                .cornerRadius(10)
            }
        }
        .onAppear {
            network.getSwimSets()
        }
    }
}

struct TestView: View {
    
    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange]
    @State private var draggingItem: Color?
    var body: some View {
        NavigationStack{
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(spacing:10), count: 2)
                LazyVGrid(columns: columns, spacing: 10, content: {
                    ForEach(colors, id: \.self) {
                        color in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color.gradient)
                            .frame(height: 100)
                    }
                })
            }
            .navigationTitle("Movable Grib")
        }
            
        }
}

struct StrokeView: View {
    @EnvironmentObject var network: Network
    var body: some View {
        ScrollView {
            Text("Swim Sets")
                .font(.title)
                .bold()
            VStack(alignment: .trailing) {
                VStack() {
                    ForEach(network.strokes) { stroke in
                        HStack() {
                            Text(stroke.title)
                                .bold()
                        }
                    }
                }
                .frame(width: 230, alignment: .leading)
                .padding()
                .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                .cornerRadius(10)
            }
        }
        .onAppear {
            network.getStrokes()
        }
    }
}

struct NewWorkoutView: View {
    
    @State private var WorkoutTitle = ""
    @State private var WorkoutDescription = "Optional Description"
    @State private var intensity = 10.0
    @State private var distance = 2000.0
    @State private var isEditing = false
    @State private var includeFreestyle = true;
    @State private var includeBreaststroke = true;
    @State private var includeButterfly = true;
    @State private var includeBackstroke = true;
    
    var body: some View {
        Form {
            TextField("Workout Name", text: $WorkoutTitle)
                .padding()
            
            Text("Intensity")
            Slider(
                    value: $intensity,
                    in: 0...10,
                    step: 1
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("10")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
            
            Text("Distance")
            Slider(
                    value: $distance,
                    in: 0...2000,
                    step: 50
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("2000")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
            
            Toggle("Include Freestyle", isOn: $includeFreestyle)
            Toggle("Include BackStroke", isOn: $includeBackstroke)
            Toggle("Include BreastStroke", isOn: $includeBreaststroke)
            Toggle("Include Butterfly", isOn: $includeButterfly)
            
              Button("Submit", action: {
                  
              })
            
            Spacer()
            Text("Workout Preview")
                .font(.headline)
                .colorScheme(.dark)
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Intensity: \(Int(intensity))")
                    Text("Distance: \(Int(distance))")
                }
                .padding()
                VStack(alignment: .leading) {
                    if includeFreestyle {
                        Text("Freestyle")
                    }
                    if includeBackstroke {
                        Text("Backstroke")
                    }
                    if includeBreaststroke {
                        Text("Breaststroke")
                    }
                    if includeButterfly {
                        Text("Butterfly")
                    }

                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}

func Void(){

}

func ChangeToSwimSetPage() {
    
}

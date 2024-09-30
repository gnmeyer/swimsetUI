import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        
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
            

        }
        .padding(.vertical)
        .onAppear {
            network.getWorkouts()
            network.getSwimSets()
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
//import SwiftUI
//
//struct ContentView: View {
//    @EnvironmentObject var network: Network
//
//    @State private var textInput: String = ""
//    @State private var jsonString: String = ""
//
//    var body: some View {
//        
//        ScrollView {
//                        Text("All users")
//                        .font(.title).bold()
//                }
//                .onAppear {
//                    network.getWorkouts()
//                }
////        VStack {
////            Text("Swim Generator")
////                .font(.title .bold())
//////            
//////            VStack {
//////                
//////                TextField("Enter Workout", text: $textInput)
//////                    .padding()
//////                    .textFieldStyle(RoundedBorderTextFieldStyle())
//////                HStack {
//////                    Button(action: {
//////                        let jsonObject: [String: Any] = [
//////                            "title": "John Doe",
//////                            "distance": 200
//////                        ]
//////                        
//////                        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []) {
//////                            // Call the function with the JSON data
//////                            DBHelper.sendPostRequest(url: "http://localhost:8080/workouts", data: jsonData)
//////                        }
//////                        print("Button tapped!")
//////                    }) {
//////                        Text("Post")
//////                            .font(.headline)
//////                            .foregroundColor(.white)
//////                            .padding(20)
//////                            .background(Circle().fill(Color.blue))
//////                    }
//////                    
//////                    
//////                }
//////                .padding()
//////                // Display JSON result
//////                Text("JSON Output:")
//////                    .font(.headline)
//////                Text(jsonString)
//////                    .padding()
//////                    .background(Color.gray.opacity(0.1))
//////                    .cornerRadius(8)
//////            }
////            
////        }
//    }
//}
//
//
//struct ContentView_Previews:
//    PreviewProvider {
//    static var previews:  some View
//    {
//        ContentView()
//        .environmentObject(Network())
//
//    }
//}

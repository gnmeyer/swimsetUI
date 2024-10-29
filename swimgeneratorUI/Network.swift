////
////  Network.swift
////  swimgeneratorUI
////
////  Created by Grant Meyer on 9/29/24.
////
//
//
//import SwiftUI
//
//class Network: ObservableObject {
//    @Published var workouts: [Workout] = []
//    @Published var swimsets: [SwimSet] = []
//    @Published var strokes: [Stroke] = []
//    
//    func getWorkouts() {
//        guard let url = URL(string: "http://127.0.0.1:8080/workouts") else { fatalError("Missing URL") }
//
//        let urlRequest = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedWorkouts = try JSONDecoder().decode([Workout].self, from: data)
//                        self.workouts = decodedWorkouts
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//
//        dataTask.resume()
//    }
//    
//    func getSwimSets() {
//        guard let url = URL(string: "http://127.0.0.1:8080/swimsets") else { fatalError("Missing URL") }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedWorkouts = try JSONDecoder().decode([SwimSet].self, from: data)
//                        self.swimsets = decodedWorkouts
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//
//        dataTask.resume()
//    }
//    
////    func getStrokes() {
////        guard let url = URL(string: "http://127.0.0.1:8080/strokes") else { fatalError("Missing URL") }
////        
////        let urlRequest = URLRequest(url: url)
////        
////        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
////            if let error = error {
////                print("Request error: ", error)
////                return
////            }
////
////            guard let response = response as? HTTPURLResponse else { return }
////
////            if response.statusCode == 200 {
////                guard let data = data else { return }
////                DispatchQueue.main.async {
////                    do {
////                        let decodedWorkouts = try JSONDecoder().decode([Stroke].self, from: data)
////                        self.strokes = decodedWorkouts
////                    } catch let error {
////                        print("Error decoding: ", error)
////                    }
////                }
////            }
////        }
////
////        dataTask.resume()
////    }
//}

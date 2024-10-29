//
//  Workout.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 9/29/24.
//

import Foundation
import SwiftData

@Model
//struct Workout:Identifiable, Codable {
class Workout:Identifiable {
//    var id: UUID
    var title: String
    var distance: Int
    var swimSets: [SwimSet]
    
//    init(id: UUID = UUID(), title: String, distance: Int, swimSets: [SwimSet] = []) {
    init(title: String, distance: Int, swimSets: [SwimSet] = []) {

//        self.id = id
        self.title = title
        self.distance = distance
        self.swimSets = swimSets
    }
}


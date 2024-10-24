//
//  SwimWorkout.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/11/24.
//

import Foundation

struct SwimWorkout: Identifiable, Codable {
    var id: UUID
    var title: String
    var distance: Int
    var swimSets: [SwimSwimSet]

    init(id: UUID = UUID(), title: String, distance: Int, swimSets: [SwimSwimSet] = []) {
        self.id = id
        self.title = title
        self.distance = distance
        self.swimSets = swimSets
    }
    
    
    struct SwimSwimSet: Identifiable, Codable {
        var id: UUID
        var title: String
        var distance: Int
        var rest: Int
        var reps: Int
        var swimStrokes: [SwimSwimStroke]
        
        init(id: UUID = UUID(), title: String, distance: Int, rest: Int, reps: Int, swimStrokes: [SwimSwimStroke] = []) {
            self.id = id
            self.title = title
            self.distance = distance
            self.rest = rest
            self.reps = reps
            self.swimStrokes = swimStrokes
        }
        
        struct SwimSwimStroke: Identifiable, Codable {
            var id: UUID
            var title: String
            
            init(id: UUID = UUID(), title: String) {
                self.id = id
                self.title = title
            }
        }
    }
}


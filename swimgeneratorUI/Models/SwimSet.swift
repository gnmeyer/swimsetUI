//
//  SwimSet.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 9/29/24.
//

import Foundation
import SwiftData

@Model
//class SwimSet:Identifiable, Codable {
class SwimSet:Identifiable {
//    var id: UUID
    var title: String
    var distance: Int
    var rest: Int
    var reps: Int
    var strokes: [Stroke]
    
    init(title: String, distance: Int, rest: Int, reps: Int, strokes: [Stroke] = []) {
//        self.id = id
        self.title = title
        self.distance = distance
        self.rest = rest
        self.reps = reps
        self.strokes = strokes
    }
}

//
//  Workout.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 9/29/24.
//

import Foundation

struct Workout:Identifiable, Decodable {
    var id: UUID
    var title: String
    var distance: Int
    var swimset_ids: [UUID]
}

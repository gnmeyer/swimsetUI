//
//  SwimSet.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 9/29/24.
//

import Foundation

struct SwimSet:Identifiable, Decodable {
    var id: UUID
    var title: String
    var distance: Int
    var rest: Int
    var reps: Int
    var stroke_ids: [UUID]
}

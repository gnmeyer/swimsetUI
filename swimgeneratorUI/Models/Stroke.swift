//
//  Stroke.swift
//  swimgeneratorUI
//
//  Created by Grant Meyer on 10/7/24.
//

import Foundation
import SwiftData

@Model
class Stroke: Identifiable {
//    var id: UUID
    var title: String
    var desc: String
    init(title: String, desc: String) {
//        self.id = UUID()
        self.title = title
        self.desc = desc
    }
}


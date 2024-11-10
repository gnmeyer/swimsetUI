//
//  SwimSet.swift
//  XCTests
//
//  Created by Grant Meyer on 11/6/24.
//

@testable import swimgeneratorUI

import XCTest

final class SwimSetXCTest: XCTestCase {

    //happy path
    func testSwimSetInitialization() {
        // Arrange
        let title = "Swim Set"
        let desc = "A single swim set"
        let distance = 100
        let rest = 10
        let reps = 30
        var strokes: [Stroke] = []
        
        let stroke = Stroke(title: title, desc: desc)

        strokes.append(stroke)
        
        // Act
        let swimSet = SwimSet(title: title, distance: distance, rest: rest, reps: reps, strokes: strokes)
        
        // Assert
        XCTAssertEqual(swimSet.title, title, "Title should match")
        XCTAssertEqual(swimSet.distance, distance, "Distance should match")
        XCTAssertEqual(swimSet.rest, rest, "Rest should match")
        XCTAssertEqual(swimSet.reps, reps, "Reps should match")
        
        XCTAssertEqual(swimSet.strokes.count, 1, "Swim set should contain exactly one stroke")

        XCTAssertEqual(swimSet.strokes.first?.title, title, "Stroke title should match")
        XCTAssertEqual(swimSet.strokes.first?.desc, desc, "Stroke description should match")

    }

}

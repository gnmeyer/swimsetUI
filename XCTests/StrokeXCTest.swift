//
//  StrokeXCTest.swift
//  XCTests
//
//  Created by Grant Meyer on 11/6/24.
//
@testable import swimgeneratorUI

import XCTest

final class StrokeXCTest: XCTestCase {
    
    //    var view: CreateStrokeView!
    //    var mockModelContext: MockModelContext!
    //
    //    override func setUpWithError() throws {
    //        mockModelContext = MockModelContext()
    //        view = CreateStrokeView(modelContext: mockModelContext) // Inject the mock model context
    //    }
    //
    //    override func tearDownWithError() throws {
    //        view = nil
    //        mockModelContext = nil
    //    }
    //
    func testStrokeInitialization() {
        // Arrange
        let title = "Freestyle"
        let desc = "A popular swimming stroke"
        
        // Act
        let stroke = Stroke(title: title, desc: desc)
        
        // Assert
        XCTAssertEqual(stroke.title, title, "The stroke title should match the provided title.")
        XCTAssertEqual(stroke.desc, desc, "The stroke description should match the provided description.")
    }
}

import XCTest
import SwiftUI
@testable import swimgeneratorUI

class HomeViewTests: XCTestCase {

    func testHomeViewRendersCorrectly() {
        // Create an instance of HomeView
        let homeView = HomeView()
        
        // Create a SwiftUI view hosting the HomeView
        let hostingController = UIHostingController(rootView: homeView)
        
        // Assert that the hosting controller is not nil
        XCTAssertNotNil(hostingController)
        
        // Render the view hierarchy
        let view = hostingController.view
        XCTAssertNotNil(view)
        
        // Perform layout
        view?.layoutIfNeeded()
        
        // Assert that the view has the expected title
        XCTAssertEqual(hostingController.navigationItem.title, "Swim Workouts")
    }
}
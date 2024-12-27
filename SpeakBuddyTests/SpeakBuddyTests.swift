//
//  SpeakBuddyTests.swift
//  SpeakBuddyTests
//
//  Created by Darul Firmansyah on 21/12/24.
//

import XCTest
@testable import SpeakBuddy

final class SpeakBuddyTests: XCTestCase {
    var viewModel: OnboardingViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = OnboardingViewModel() // Initialize the ViewModel
    }
    
    override func tearDown() {
        viewModel = nil // Clean up after each test
        super.tearDown()
    }
    
    func testIncrement() {
        XCTAssertNotNil(viewModel.chartData)
    }
    
}

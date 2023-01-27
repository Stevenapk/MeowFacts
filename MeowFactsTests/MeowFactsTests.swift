//
//  MeowFactsTests.swift
//  MeowFactsTests
//
//  Created by Steven Sullivan on 1/26/23.
//

import XCTest
@testable import MeowFacts

class MockKittenFactService: KittenFactServiceProtocol {

    var delegate: KittenViewModel?
    var factAPICalled = false
    func fetchData(completionHandler: @escaping (MeowFacts.KittenFact) -> ()) {
        factAPICalled = true
    }
}

final class MeowFactsTests: XCTestCase {
    
    var mockKittenFactService: MockKittenFactService!

    override func setUpWithError() throws {
        mockKittenFactService = MockKittenFactService()
    }

    func testFactAPI() throws {
        let homeVC = HomeVC()
        homeVC.viewModel = KittenViewModel(helper: mockKittenFactService)
        homeVC.viewModel.getKittenFact()
        XCTAssertTrue(mockKittenFactService.factAPICalled)
    }
    
    func testScreenTap() throws {
        let homeVC = HomeVC()
        homeVC.viewModel = KittenViewModel(helper: mockKittenFactService)
        
        //programmatically trigger screen touch
        let touchArray = NSMutableArray()
        touchArray.add(UITouch())
        let touch = NSSet()
        touch.adding(touchArray)
        homeVC.touchesEnded(touch as! Set<UITouch>, with: nil)
        
        //assert that the api gets called after screen touch
        XCTAssertTrue(mockKittenFactService.factAPICalled)
    }
    
}

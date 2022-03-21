//
//  jobDetailsUnitTests.swift
//  JobFinderUITests
//
//  Created by Naval Hasan on 20/03/22.
//

import XCTest

class jobDetailsUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ApplyButton_Should_Exist() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstChild = app.tables.element(boundBy: 0)
        firstChild.tap()
        
        let applyNowButton = app/*@START_MENU_TOKEN@*/.staticTexts["APPLY NOW"]/*[[".buttons[\"APPLY NOW\"].staticTexts[\"APPLY NOW\"]",".staticTexts[\"APPLY NOW\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(applyNowButton.exists)
        
    }

}

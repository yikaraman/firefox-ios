/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest

class NoImageTests: BaseTestCase {
    static let NoImageButtonIdentifier = "menu-NoImageMode"

    private func showImages() {
        navigator.goto(BrowserTabMenu)
        app.tables["Context Menu"].cells["menu-NoImageMode"].tap()
        navigator.nowAt(BrowserTab)
    }

    private func hideImages() {
        navigator.goto(BrowserTabMenu)
        app.tables["Context Menu"].cells["menu-NoImageMode"].tap()
        navigator.nowAt(BrowserTab)
    }

    private func checkShowImages() {
        navigator.goto(BrowserTabMenu)
        waitforExistence(app.tables["Context Menu"].cells["menu-NoImageMode"])
        XCTAssertTrue(app.tables["Context Menu"].cells["menu-NoImageMode"].staticTexts["Show Images"].exists)
        navigator.goto(BrowserTab)
    }

    private func checkHideImages() {
        navigator.goto(BrowserTabMenu)
        waitforExistence(app.tables["Context Menu"].cells["menu-NoImageMode"])
        XCTAssertTrue(app.tables["Context Menu"].cells["menu-NoImageMode"].staticTexts["Hide Images"].exists)
        navigator.goto(BrowserTab)
    }

    // Functionality is tested by UITests/NoImageModeTests, here only the UI is updated properly
    func testImageOnOff() {
        // Go to a webpage, and select no images or hide images, check it's hidden or not
        navigator.openNewURL(urlString: "www.google.com")
        waitUntilPageLoad()

        // Select hide images, and check the UI is updated
        hideImages()
        checkShowImages()

        // Select show images, and check the UI is updated
        showImages()
        checkHideImages()
    }
}

//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Ilya Kalin on 21.02.2024.
//

import XCTest

final class MovieQuizUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app.terminate()
        app = nil
    }
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testYesButton() {
        sleep(3)
        
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["Yes"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        XCTAssertEqual(indexLabel.label, "2/10")
        
    }
    
    func testNoButton() {
        sleep(3)
        
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["No"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        XCTAssertEqual(indexLabel.label, "2/10")
    }
    
    // Тест алерта завершения игры
    func testResultAlert() {
        sleep(2)
        
        for _ in Range (1...10) {
            app.buttons["Yes"].tap()
            sleep(2)
        }
        // У меня почему-то не проходил XCTAssertTrue, если я явно указывал app.alerts[id]
        let resultAlert = app.alerts.element(boundBy: 0)

        XCTAssertTrue(resultAlert.waitForExistence(timeout: 3))

        let alertTitle = resultAlert.staticTexts.element(boundBy: 0).label
        let alertButton = resultAlert.buttons.element(boundBy: 0).label

        XCTAssertEqual(alertTitle, "Этот раунд окончен!")
        XCTAssertEqual(alertButton, "Сыграть еще раз")

    }
    
    // Тест скрытия алерта завершения игры
    func testResultAlertDismiss() {
        sleep(2)
        
        for _ in Range (1...10) {
            app.buttons["Yes"].tap()
            sleep(2)
        }
        
        let resultAlert = app.alerts.element(boundBy: 0)
        resultAlert.buttons.firstMatch.tap()
        
        sleep(4)
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertFalse(resultAlert.exists)
        XCTAssertTrue(indexLabel.label == "1/10")
    }
    
}

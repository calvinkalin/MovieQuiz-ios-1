//
//  MovieQuizPresenterTests.swift
//  MovieQuizPresenterTests
//
//  Created by Ilya Kalin on 21.02.2024.
//

import Foundation
import XCTest
@testable import MovieQuiz


final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    
    var yesButton: UIButton!

    var noButton: UIButton!

    var alertModel: MovieQuiz.AlertModel?

    var activityIndicator: UIActivityIndicatorView!

    func show(quiz step: MovieQuiz.QuizStepViewModel) {
    }

    func show(quiz result: MovieQuiz.AlertModel) {
    }

    func highlightImageBorder(isCorrectAnswer: Bool) {
    }

    func showNetworkError(message: String) {
    }
    
    func showLoadingIndicator() {
    }
    
    func hideLoadingIndicator() {
    }
    
    func changeStateButtons(isEnabled: Bool) {
    }
}


final class MovieQuizPresenterTests: XCTestCase {

    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)

        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)

        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}

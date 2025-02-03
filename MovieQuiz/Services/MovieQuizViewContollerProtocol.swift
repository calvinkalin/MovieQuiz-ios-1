//
//  MovieQuizViewContollerProtocol.swift
//  MovieQuiz
//
//  Created by Ilya Kalin on 21.02.2024.
//

import Foundation
import UIKit

protocol MovieQuizViewControllerProtocol: AnyObject {
    var yesButton: UIButton! { get }
    var noButton: UIButton! { get }
    
    var activityIndicator: UIActivityIndicatorView! { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func changeStateButtons(isEnabled: Bool)
    
    func show(quiz step: QuizStepViewModel)
    func show(quiz result: AlertModel)
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func showNetworkError(message: String)
}

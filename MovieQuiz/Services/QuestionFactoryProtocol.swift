import Foundation

protocol QuestionFactoryProtocol: AnyObject {
    func requestNextQuestion()
    func loadData()
    var delegate: QuestionFactoryDelegate? { get set }
}



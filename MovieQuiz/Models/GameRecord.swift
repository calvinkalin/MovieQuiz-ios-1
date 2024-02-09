import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThen(_ another: GameRecord) -> Bool {
        correct > another.correct
    }
}

import Foundation

final class TwoPlayerViewModel: GameResultControl, Game, ObservableObject {
    
    @Published var board = [[Cell]]()
    @Published var turn = Turn.xmark
    @Published var canSelec = true
    @Published var text = "Игрок 1"
    
    override init() {
        super.init()
        resetBoard()
    }
    
    func resetBoard() {
        
        self.board = newBoard()
        self.canSelec = true
        self.text = "Игрок 1"
    }
    
    func placeTile(row: Int, column: Int) {
        
        guard self.board[row][column].tile == .empty else { return }
        
        self.board[row][column].tile = self.turn == .circle ? .cirlce : .xmark
        
        if checkToContinueGame() {
            changeTurn()
        }
    }

    func checkToContinueGame() ->Bool {
        if checkVictory(board: &self.board, turn: &self.turn) {
            switch turn {
            case .circle:
                self.text = "Игрок 2 выиграл"
            case .xmark:
                self.text = "Игрок 1 выиграл"
            }
            self.canSelec = false
            return false
        }
        return true
    }
    
    internal func changeTurn() {
        if self.turn == .circle {
            self.turn = .xmark
            self.text = "Игрок 1"
        } else {
            self.turn = .circle
            self.text = "Игрок 2"
        }
    }
}

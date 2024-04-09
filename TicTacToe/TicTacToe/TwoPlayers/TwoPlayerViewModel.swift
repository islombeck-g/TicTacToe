
import Foundation

final class TwoPlayerViewModel: ObservableObject {
    
    @Published var board = [[Cell]]()
    @Published var turn = Turn.xmark
    @Published var canSelec = true
    @Published var text = "Игрок 1"
    
    init() {
        resetBoard()
    }
    
    func placeTile(row: Int, column: Int) {
        
        guard self.board[row][column].tile == .empty else { return }
        
        self.board[row][column].tile = self.turn == .circle ? .cirlce : .xmark
        
        guard !checkVictory() else {
            
            switch turn {
            case .circle:
                self.text = "Игрок 2 выиграл"
            case .xmark:
                self.text = "Игрок 1 выиграл"
            }
            self.canSelec = false
            return
        }
        
        if self.turn == .circle {
            self.turn = .xmark
            self.text = "Игрок 1"
        } else {
            self.turn = .circle
            self.text = "Игрок 2"
        }
    }

    func resetBoard() {
        
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                let cell = Cell(tile: .empty)
                row.append(cell)
            }
            newBoard.append(row)
        }
        self.board = newBoard
        self.canSelec = true
        self.text = "Игрок 1"
    }
    
    private func checkVictory() ->Bool {
        
        //      vertical
        if  isTurnLine(row: 0, column: 0) &&
            isTurnLine(row: 1, column: 0) &&
            isTurnLine(row: 2, column: 0) {
            
            self.board[0][0].updateDiagonal(diagonal: .vertical)
            self.board[1][0].updateDiagonal(diagonal: .vertical)
            self.board[2][0].updateDiagonal(diagonal: .vertical)
            return true
        }
        
        if  isTurnLine(row: 0, column: 1) &&
            isTurnLine(row: 1, column: 1) &&
            isTurnLine(row: 2, column: 1) {
           
            self.board[0][1].updateDiagonal(diagonal: .vertical)
            self.board[1][1].updateDiagonal(diagonal: .vertical)
            self.board[2][1].updateDiagonal(diagonal: .vertical)
            return true
        }
        
        if  isTurnLine(row: 0, column: 2) &&
            isTurnLine(row: 1, column: 2) &&
            isTurnLine(row: 2, column: 2) {
            
            self.board[0][2].updateDiagonal(diagonal: .vertical)
            self.board[1][2].updateDiagonal(diagonal: .vertical)
            self.board[2][2].updateDiagonal(diagonal: .vertical)
            return true
        }
        
        //        horizontal
        if  isTurnLine(row: 0, column: 0) &&
            isTurnLine(row: 0, column: 1) &&
            isTurnLine(row: 0, column: 2) {
            
            self.board[0][0].updateDiagonal(diagonal: .horizontal)
            self.board[0][1].updateDiagonal(diagonal: .horizontal)
            self.board[0][2].updateDiagonal(diagonal: .horizontal)
            
            return true
        }
        
        if  isTurnLine(row: 1, column: 0) &&
            isTurnLine(row: 1, column: 1) &&
            isTurnLine(row: 1, column: 2) {
            
            self.board[1][0].updateDiagonal(diagonal: .horizontal)
            self.board[1][1].updateDiagonal(diagonal: .horizontal)
            self.board[1][2].updateDiagonal(diagonal: .horizontal)
            
            return true
        }
        
        if  isTurnLine(row: 2, column: 0) &&
            isTurnLine(row: 2, column: 1) &&
            isTurnLine(row: 2, column: 2) {
            
            self.board[2][0].updateDiagonal(diagonal: .horizontal)
            self.board[2][1].updateDiagonal(diagonal: .horizontal)
            self.board[2][2].updateDiagonal(diagonal: .horizontal)
            
            return true
        }
        
        //        diagonal
        if  isTurnLine(row: 0, column: 0) &&
            isTurnLine(row: 1, column: 1) &&
            isTurnLine(row: 2, column: 2) {
            
            self.board[0][0].updateDiagonal(diagonal: .diagonalMain)
            self.board[1][1].updateDiagonal(diagonal: .diagonalMain)
            self.board[2][2].updateDiagonal(diagonal: .diagonalMain)
            
            return true
        }
        
        if  isTurnLine(row: 0, column: 2) &&
            isTurnLine(row: 1, column: 1) &&
            isTurnLine(row: 2, column: 0) {
        
            self.board[0][2].updateDiagonal(diagonal: .diagonalAnti)
            self.board[1][1].updateDiagonal(diagonal: .diagonalAnti)
            self.board[2][0].updateDiagonal(diagonal: .diagonalAnti)
            
            return true
        }
        
        return false
    }
    
    private func isTurnLine(row: Int, column: Int) ->Bool {
        board[row][column].tile.rawValue == turn.rawValue
    }
    
}

import Foundation

class GameResultControl {
    
    func newBoard() ->[[Cell]] {
        
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                let cell = Cell(tile: .empty)
                row.append(cell)
            }
            newBoard.append(row)
        }
        
        return newBoard
    }
    
    func checkVictory(board: inout [[Cell]], turn: inout Turn) ->Bool {
        
        //      vertical
        if  isTurnLine(board: &board, turn: &turn, row: 0, column: 0) &&
            isTurnLine(board: &board, turn: &turn, row: 1, column: 0) &&
            isTurnLine(board: &board, turn: &turn, row: 2, column: 0) {
            
            board[0][0].updateDiagonal(diagonal: .vertical)
            board[1][0].updateDiagonal(diagonal: .vertical)
            board[2][0].updateDiagonal(diagonal: .vertical)
            return true
        }
        
        if  isTurnLine(board: &board, turn: &turn, row: 0, column: 1) &&
            isTurnLine(board: &board, turn: &turn, row: 1, column: 1) &&
            isTurnLine(board: &board, turn: &turn, row: 2, column: 1) {
           
            board[0][1].updateDiagonal(diagonal: .vertical)
            board[1][1].updateDiagonal(diagonal: .vertical)
            board[2][1].updateDiagonal(diagonal: .vertical)
            return true
        }
        
        if  isTurnLine(board: &board, turn: &turn, row: 0, column: 2) &&
            isTurnLine(board: &board, turn: &turn, row: 1, column: 2) &&
            isTurnLine(board: &board, turn: &turn, row: 2, column: 2) {
            
            board[0][2].updateDiagonal(diagonal: .vertical)
            board[1][2].updateDiagonal(diagonal: .vertical)
            board[2][2].updateDiagonal(diagonal: .vertical)
            return true
        }
        
        //        horizontal
        if  isTurnLine(board: &board, turn: &turn, row: 0, column: 0) &&
            isTurnLine(board: &board, turn: &turn, row: 0, column: 1) &&
            isTurnLine(board: &board, turn: &turn, row: 0, column: 2) {
            
            board[0][0].updateDiagonal(diagonal: .horizontal)
            board[0][1].updateDiagonal(diagonal: .horizontal)
            board[0][2].updateDiagonal(diagonal: .horizontal)
            
            return true
        }
        
        if  isTurnLine(board: &board, turn: &turn, row: 1, column: 0) &&
            isTurnLine(board: &board, turn: &turn, row: 1, column: 1) &&
            isTurnLine(board: &board, turn: &turn, row: 1, column: 2) {
            
            board[1][0].updateDiagonal(diagonal: .horizontal)
            board[1][1].updateDiagonal(diagonal: .horizontal)
            board[1][2].updateDiagonal(diagonal: .horizontal)
            
            return true
        }
        
        if  isTurnLine(board: &board, turn: &turn, row: 2, column: 0) &&
            isTurnLine(board: &board, turn: &turn, row: 2, column: 1) &&
            isTurnLine(board: &board, turn: &turn, row: 2, column: 2) {
            
            board[2][0].updateDiagonal(diagonal: .horizontal)
            board[2][1].updateDiagonal(diagonal: .horizontal)
            board[2][2].updateDiagonal(diagonal: .horizontal)
            
            return true
        }
        
        //        diagonal
        if  isTurnLine(board: &board, turn: &turn, row: 0, column: 0) &&
            isTurnLine(board: &board, turn: &turn, row: 1, column: 1) &&
            isTurnLine(board: &board, turn: &turn, row: 2, column: 2) {
            
            board[0][0].updateDiagonal(diagonal: .diagonalMain)
            board[1][1].updateDiagonal(diagonal: .diagonalMain)
            board[2][2].updateDiagonal(diagonal: .diagonalMain)
            
            return true
        }
        
        if  isTurnLine(board: &board, turn: &turn, row: 0, column: 2) &&
            isTurnLine(board: &board, turn: &turn, row: 1, column: 1) &&
            isTurnLine(board: &board, turn: &turn, row: 2, column: 0) {
        
            board[0][2].updateDiagonal(diagonal: .diagonalAnti)
            board[1][1].updateDiagonal(diagonal: .diagonalAnti)
            board[2][0].updateDiagonal(diagonal: .diagonalAnti)
            
            return true
        }
        
        return false
    }
    
    private func isTurnLine(
        board: inout [[Cell]],
        turn: inout Turn,
        row: Int, column: Int
    ) ->Bool {
        board[row][column].tile.rawValue == turn.rawValue
    }
}


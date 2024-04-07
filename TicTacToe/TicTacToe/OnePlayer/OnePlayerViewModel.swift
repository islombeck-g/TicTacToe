import Foundation

final class OnePlayerViewModel: ObservableObject {
    
    @Published var board = [[Cell]]()
    @Published var turn = Turn.xmark
    @Published var canSelec = true
    @Published var text = "Ваша очередь"
    
    @Published var selectedSide = Turn.xmark
    
    init() {
        resetBoard()
    }
    
    private func canChose() ->Bool {
        
        for i in self.board {
            for ii in i {
                if ii.tile == .empty { return true }
            }
        }
        
        return false
    }
    
    func choseSide(side: Turn) {
        self.selectedSide = side
        resetBoard()
    }
    
    func placeTile(row: Int, column: Int) {
        
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
    }
    
    private func checkVictory() ->Bool {
        
        //      vertical
        if isTurnLine(row: 0, column: 0) && isTurnLine(row: 1, column: 0) && isTurnLine(row: 2, column: 0) { return true }
        if isTurnLine(row: 0, column: 1) && isTurnLine(row: 1, column: 1) && isTurnLine(row: 2, column: 1) { return true }
        if isTurnLine(row: 0, column: 2) && isTurnLine(row: 1, column: 2) && isTurnLine(row: 2, column: 2) { return true }
        
        //        horizontal
        if isTurnLine(row: 0, column: 0) && isTurnLine(row: 0, column: 1) && isTurnLine(row: 0, column: 2) { return true }
        if isTurnLine(row: 1, column: 0) && isTurnLine(row: 1, column: 1) && isTurnLine(row: 1, column: 2) { return true }
        if isTurnLine(row: 2, column: 0) && isTurnLine(row: 2, column: 1) && isTurnLine(row: 2, column: 2) { return true }
        
        //        diagonal
        if isTurnLine(row: 0, column: 0) && isTurnLine(row: 1, column: 1) && isTurnLine(row: 2, column: 2) { return true }
        if isTurnLine(row: 0, column: 2) && isTurnLine(row: 1, column: 1) && isTurnLine(row: 2, column: 0) { return true }
        
        return false
    }
    private func isTurnLine(row: Int, column: Int) ->Bool {
        board[row][column].tile.rawValue == turn.rawValue
    }
    
}


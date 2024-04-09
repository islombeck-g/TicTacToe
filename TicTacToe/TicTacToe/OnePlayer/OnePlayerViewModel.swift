import Foundation

final class OnePlayerViewModel: ObservableObject {
    
    @Published var board = [[Cell]]()
    @Published var canSelec = true
    @Published var gameIsOn = false
    @Published var text = "Ваша очередь"
    
    private var selectedSide = Turn.xmark
    private var turn = Turn.xmark
    
    init() {
        resetBoard()
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
        
        self.turn = .xmark
        
        if self.selectedSide == .circle {
            self.text = "Думаю..."
            self.artificialIntelligenceChose()
        } else {
            self.text = "Ваша очередь"
        }
        
    }
    func choseSide(side: Turn) {
        resetBoard()
        
        self.selectedSide = side
        
        self.turn = .xmark
        
        if side == .circle {
            self.artificialIntelligenceChose()
        }
    }
    
    func placeTile(row: Int, column: Int) {
        
        guard self.canSelec else { print(1);return }
        guard self.turn == self.selectedSide else { print(2);return }
        
        guard self.board[row][column].tile == .empty else { print(3);return }
        print(4)
        self.board[row][column].tile = self.selectedSide == .circle ? .cirlce : .xmark
        print(5)
        
        if self.checkToContinueGame() {
            self.changeTurn()
            self.artificialIntelligenceChose()
        }
    }

    private func artificialIntelligenceChose() {
        
        guard self.canChose() else {
            self.text = "Ничья"
            return
        }
        self.text = "Думаю..."
        self.canSelec = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            
            while true {
                let randX = Int.random(in: 0..<self.board.count)
                let randY = Int.random(in: 0..<self.board[0].count)
                
                if self.board[randX][randY].tile == .empty {
                    self.board[randX][randY].tile = self.selectedSide == .circle ? .xmark: .cirlce
                    break
                }
            }
            if self.checkToContinueGame() {
                self.canSelec = true
                changeTurn()
                self.text = "Твой Ход"
            }
        }
    }
    
    private func checkToContinueGame() ->Bool {
//        проверка, есть ли победитель
        if checkVictory() {
            
            switch turn {
            case .circle:
                self.text = self.selectedSide == .circle ? "Вы выиграли": "Вы проиграли"
            case .xmark:
                self.text = self.selectedSide == .circle ? "Вы проиграли": "Вы выиграли"
            }
            self.canSelec = false
            return false
        }
        return true
    }
    
    private func changeTurn() {
        if self.selectedSide == .circle {
            if self.turn == .circle {
                self.turn = .xmark
            } else {
                self.turn = .circle
            }
        } else {
            if self.turn == .circle {
                self.turn = .xmark
            } else {
                self.turn = .circle
            }
        }
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
    
    private func canChose() ->Bool {
        
        for i in self.board {
            for ii in i {
                if ii.tile == .empty { return true }
            }
        }
        return false
    }
}


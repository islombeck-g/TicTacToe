import Foundation

final class OnePlayerViewModel: GameResultControl, Game, ObservableObject {
    
    @Published var board = [[Cell]]()
    @Published var canSelec = true
    @Published var gameIsOn = false
    @Published var text = "Ваша очередь"
    
    private var selectedSide = Turn.xmark
    private var turn = Turn.xmark
    
    override init() {
        super.init()
        resetBoard()
    }
    
    func resetBoard() {
        
        self.board = newBoard()
        self.canSelec = true
        
        self.turn = .xmark
        
        if self.selectedSide == .circle {
            self.text = "Думаю..."
            self.artificialIntelligenceChose()
        } else {
            self.text = "Ваша очередь"
        }
    }
    
    func placeTile(row: Int, column: Int) {
        
        guard self.canSelec else { return }
        guard self.turn == self.selectedSide else { return }
        
        guard self.board[row][column].tile == .empty else { return }
        
        self.board[row][column].tile = self.selectedSide == .circle ? .cirlce : .xmark
        
        if self.checkToContinueGame() {
            self.changeTurn()
            self.artificialIntelligenceChose()
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
    
    internal func checkToContinueGame() ->Bool {
//        проверка, есть ли победитель
        if checkVictory(board: &self.board, turn: &self.turn) {
            
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
    
    internal func changeTurn() {
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
   
    private func canChose() ->Bool {
        
        for i in self.board {
            for ii in i {
                if ii.tile == .empty { return true }
            }
        }
        return false
    }
}


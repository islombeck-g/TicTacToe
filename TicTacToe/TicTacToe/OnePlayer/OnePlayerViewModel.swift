import Foundation

final class OnePlayerViewModel: ObservableObject {
    
    @Published var board = [[Cell]]()
    @Published var turn = Tile.xmark
    
    init() {
       resetBoard()
    }
    
    func placeTile(row: Int, column: Int) {
        guard self.board[row][column].tile == .empty else { return }
        
        self.board[row][column].tile = self.turn == .cirlce ? .cirlce : .xmark
        self.turn = turn == .cirlce ? .xmark : .cirlce
    }
    
    private func resetBoard() {
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
    }
}


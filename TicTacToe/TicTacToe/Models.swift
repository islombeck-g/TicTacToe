protocol Game: AnyObject {
    func placeTile(row: Int, column: Int)
    func resetBoard()
    func checkToContinueGame() ->Bool
    func changeTurn()
}

enum GameMode {
    case onePlayerRandom
    case twoPlayers
}

enum Turn: String {
    case circle = "circle"
    case xmark = "xmark"
}

enum Diagonal {
    case vertical
    case horizontal
    case diagonalMain // \
    case diagonalAnti // /
}

enum Tile: String {
    case cirlce = "circle"
    case xmark = "xmark"
    case empty
    
}

struct Cell {
    var tile: Tile
    var result: Diagonal?
    
    func displayTile() -> String {
        switch tile {
        case .cirlce:
            "circle"
        case .xmark:
            "xmark"
        case .empty:
            ""
        }
    }
    
    func tileColor() -> String {
        switch tile {
        case .xmark:
            "XmarkColor"
        case .cirlce:
            "CircleColor"
        case .empty:
            "BackgroundLightColor"
        }
    }
    
    mutating func updateDiagonal(diagonal: Diagonal) {
        self.result = diagonal
    }
}

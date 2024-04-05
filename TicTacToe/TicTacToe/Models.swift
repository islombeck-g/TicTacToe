import Foundation

enum Turn: String {
    case circle = "circle"
    case xmark = "xmark"
}

enum Tile: String {
    case cirlce = "circle"
    case xmark = "xmark"
    case empty
}

struct Cell {
    var tile: Tile
    
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
}

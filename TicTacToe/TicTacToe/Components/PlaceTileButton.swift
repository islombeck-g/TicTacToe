import SwiftUI

struct PlaceTileButton: View {
    
    var cell: Cell
    
    var body: some View {
        Image(systemName: cell.displayTile())
            .frame(width: 80, height: 80)
            .font(.system(size: 90))
            .bold()
            .foregroundStyle(Color(cell.tileColor()))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .background(Color("BackgroundDarkColor"))
            .overlay(
                Group {
                    if let result = self.cell.result {
                        switch result {
                        case .vertical:
                            Path { path in
                                let start = CGPoint(x: 50, y: 0)
                                let end = CGPoint(x: 50, y: 100)
                                path.move(to: start)
                                path.addLine(to: end)
                            }
                            .stroke(Color("SpringGreenColor"), lineWidth: 15)
                        case .horizontal:
                            Path { path in
                                let start = CGPoint(x: 0, y: 50)
                                let end = CGPoint(x: 100, y: 50)
                                path.move(to: start)
                                path.addLine(to: end)
                            }
                            .stroke(Color("SpringGreenColor"), lineWidth: 15)
                        case .diagonalMain:
                            Path { path in
                                let start = CGPoint(x: 0, y: 0)
                                let end = CGPoint(x: 100, y: 100)
                                path.move(to: start)
                                path.addLine(to: end)
                            }
                            .stroke(Color("SpringGreenColor"), lineWidth: 15)
                        case .diagonalAnti:
                            Path { path in
                                let start = CGPoint(x: 100, y: 0)
                                let end = CGPoint(x: 0, y: 100)
                                path.move(to: start)
                                path.addLine(to: end)
                            }
                            .stroke(Color("SpringGreenColor"), lineWidth: 15)
                        }
                    }
                }
            )
    }
}

#Preview {
    PlaceTileButton(cell: Cell(tile: Tile.xmark, result: .horizontal))
}

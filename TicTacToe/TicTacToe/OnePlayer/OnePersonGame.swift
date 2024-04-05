import SwiftUI

struct OnePersonGame: View {
    
    @StateObject var viewModel = OnePlayerViewModel()
    
    let borderSize = CGFloat(10)
    
    var body: some View {
        VStack {
            
            VStack(spacing: borderSize) {
                ForEach(0...2, id: \.self) { row in
                    HStack(spacing: borderSize) {
                        ForEach(0...2, id: \.self) { column in
                            
                            let elem = viewModel.board[row][column]

                                Image(systemName: elem.displayTile())
                                    .frame(width: 80, height: 80)
                                    .font(.system(size: 90))
                                    .bold()
                                    .foregroundStyle(Color(elem.tileColor()))
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .aspectRatio(1, contentMode: .fit)
                                    .background(.white)
                                    .onTapGesture {
                                        withAnimation(.bouncy) {
                                            viewModel.placeTile(row: row, column: column)
                                        }
                                    }
                            .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .background(Color("SpringGreenColor"))
        }
    }
}

#Preview {
    OnePersonGame()
}

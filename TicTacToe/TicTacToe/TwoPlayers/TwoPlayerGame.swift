import SwiftUI

struct TwoPlayerGame: View {
    
    @EnvironmentObject var viewModel: TwoPlayerViewModel
    @Environment(\.dismiss) var dismiss
    let borderSize = CGFloat(10)
    
    var body: some View {
        VStack {
            HStack(spacing: 210) {
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundStyle(Color("ButtonYellowColor"))
                        .font(.system(size: 50))
                        .bold()
                        .frame(width: 80, height: 80)
                }
                Button {
                        self.viewModel.resetBoard()
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .foregroundStyle(Color("BlueLightColor"))
                        .font(.system(size: 40))
                        .bold()
                        .frame(width: 80, height: 80)
                }
                
                
            }
            .padding(.top, 20)
            
            Text(self.viewModel.text)
                .font(.custom("Chalkboard SE",size: 36))
                .fontWeight(.medium)
                .foregroundStyle(Color("SpringGreenColor"))
            
            VStack(spacing: borderSize) {
                ForEach(0...2, id: \.self) { row in
                    HStack(spacing: borderSize) {
                        ForEach(0...2, id: \.self) { column in
                            
                            let elem = viewModel.board[row][column]
                            
                            ZStack {
                                PlaceTileButton(cell: elem, gameMode: .twoPlayers)
                                    .onTapGesture {
                                        if self.viewModel.canSelec {
                                            withAnimation(.bouncy) {
                                                viewModel.placeTile(row: row, column: column)
                                            }
                                        }
                                    }
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .background(Color("SpringGreenColor"))
            .frame(maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    TwoPlayerGame()
        .environmentObject(TwoPlayerViewModel())
}

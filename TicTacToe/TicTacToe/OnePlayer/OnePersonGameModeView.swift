import SwiftUI

struct OnePersonGameModeView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: OnePlayerViewModel
    
    @State var showGame: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Вибери Сторону")
                    .font(.custom("Chalkboard SE",size: 36))
                    .fontWeight(.medium)
                    .foregroundStyle(Color("SpringGreenColor"))
                
                HStack(spacing: 30) {
                    Button {
                        self.viewModel.choseSide(side: .xmark)
                        self.showGame.toggle()
                    } label: {
                        ButtonsWithRoundedRectangle(image: ("xmark", "ButtonYellowColor"))
                    }
                    
                    Button {
                        self.viewModel.choseSide(side: .circle)
                        self.showGame.toggle()
                    } label: {
                        ButtonsWithRoundedRectangle(image: ("circle", "ButtonRedColor"))
                    }
                }
            }
            .frame(width: 300, height: 250)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color("BackgroundDarkColor"))
            }
            
            Button {
                self.dismiss()
            } label: {
                ChoseGameModeButton(text: "Меню", images: [])
            }
            .background(Color("ButtonRedColor"))
            .clipShape(.rect(cornerRadius: 16))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("MainViewBackgroundColor"))
        .sheet(isPresented: self.$showGame) {
            OnePersonGame()
                .onDisappear {
                    self.viewModel.resetBoard() 
                }
        }
    }
}

#Preview {
    OnePersonGameModeView()
        .environmentObject(OnePlayerViewModel())
}

import SwiftUI

struct ChoseView: View {
    
    @State var showOnePersonGameMode: Bool = false
    @State var showTwoPeopleGameMode: Bool = false
    
    @StateObject var onePlayerViewModel = OnePlayerViewModel()
    @StateObject var twoPlayersViewModel = TwoPlayerViewModel()
    
    var body: some View {
        VStack(spacing: 8) {
            Image("GameNameImage")
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 16))
                .frame(width: 300, height: 150)
                
            Button {
                self.showOnePersonGameMode.toggle()
            } label: {
                ChoseGameModeButton(
                    text: "1 Игрок",
                    images: [("person.fill", "Person1Color")])
            }
            .background(Color("ButtonRedColor"))
            .clipShape(.rect(cornerRadius: 16))
            Button {
                self.showTwoPeopleGameMode.toggle()
            } label: {
                ChoseGameModeButton(
                    text: "2 Игрока",
                    images: [("person.fill", "Person1Color"), ("person.fill", "Person2Color")])
            }
            .background(Color("ButtonRedColor"))
            .clipShape(.rect(cornerRadius: 16))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("MainViewBackgroundColor"))
        
        .sheet(isPresented: self.$showOnePersonGameMode) {
            OnePersonGameModeView()
                .environmentObject(self.onePlayerViewModel)
        }
        .sheet(isPresented: self.$showTwoPeopleGameMode) {
            TwoPlayerGame()
                .environmentObject(self.twoPlayersViewModel)
                .onDisappear {
                    self.twoPlayersViewModel.resetBoard()
                }
        }
    }
}

#Preview {
    ChoseView()
}

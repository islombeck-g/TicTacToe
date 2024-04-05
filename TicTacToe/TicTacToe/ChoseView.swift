import SwiftUI

struct ChoseView: View {
    
    @State var showOnePersonGameMode: Bool = false
    @State var showTwoPeopleGameMode: Bool = false
    
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
                ChoseGameModeButton(text: "1 Игрок", imageOne: ("person.fill", "Person1Color"), imageTwo: nil)
            }
            .background(Color("ButtonRedColor"))
            .clipShape(.rect(cornerRadius: 16))
            Button {} label: {
                ChoseGameModeButton(text: "2 Игрока", imageOne: ("person.fill", "Person1Color"), imageTwo: ("person.fill", "Person2Color"))
            }
            .background(Color("ButtonRedColor"))
            .clipShape(.rect(cornerRadius: 16))
        }
        .sheet(isPresented: self.$showOnePersonGameMode) {
            OnePersonGameModeView()
        }
        .sheet(isPresented: self.$showTwoPeopleGameMode) {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("MainViewBackgroundColor"))
    }
}

#Preview {
    ChoseView()
}

import SwiftUI

struct ChoseView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image("GameNameImage")
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 16))
                .frame(width: 300, height: 150)
                
            Button {} label: {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color("MainViewBackgroundColor"))
    }
}

#Preview {
    ChoseView()
}

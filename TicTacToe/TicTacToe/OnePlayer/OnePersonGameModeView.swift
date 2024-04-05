import SwiftUI

struct OnePersonGameModeView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            VStack {
                Text("Вибери Сторону")
                    .font(.custom("Chalkboard SE",size: 36))
                    .fontWeight(.medium)
                    .foregroundStyle(Color("SpringGreenColor"))
                
                HStack(spacing: 30) {
                    Button {
                        
                    } label: {
                        ButtonsWithRoundedRectangle(image: ("xmark", "ButtonYellowColor"))
                    }
                    
                    Button {
                        
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
                ChoseGameModeButton(text: "Меню", imageOne: nil, imageTwo: nil)
            }
            .background(Color("ButtonRedColor"))
            .clipShape(.rect(cornerRadius: 16))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("MainViewBackgroundColor"))
    }
}

#Preview {
    OnePersonGameModeView()
}

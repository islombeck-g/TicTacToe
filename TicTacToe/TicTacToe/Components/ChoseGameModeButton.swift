import SwiftUI

struct ChoseGameModeButton: View {
    
    let text: String
    let images: [(String, String)]
    
    var body: some View {
        HStack(alignment: .center) {
            
            GameModeButtonImages(images: self.images)
            
            Text(text)
                .font(.custom("Chalkboard SE",size: 36))
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
        .frame(width: 300, height: 80)
    }
}


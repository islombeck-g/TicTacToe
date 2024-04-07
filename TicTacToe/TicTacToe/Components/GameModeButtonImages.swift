import SwiftUI

struct GameModeButtonImages: View {
    
    let images: [(String, String)]
    var padd: Int = 0
    
    var body: some View {
        ZStack {
            ForEach(images.indices) { index in
                Image(systemName: images[index].0)
                    .foregroundStyle(Color(images[index].1))
                    .font(.system(size: 36))
                    .padding(.leading, CGFloat(index) * 40)
            }
        }
    }
}

//#Preview {
//    GameModeButtonImages()
//}

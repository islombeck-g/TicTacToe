import SwiftUI

struct ButtonsWithRoundedRectangle: View {
    
    let image: (String, String)
    
    var body: some View {
        Image(systemName: self.image.0)
            .font(.system(size: 50))
            .bold()
            .foregroundStyle(Color(image.1))
            .padding(5)
            .frame(width: 80, height: 80)
            .background {
                RoundedRectangle(cornerRadius: 8).stroke(style: StrokeStyle(lineWidth: 1))
                    .foregroundStyle(Color("SpringGreenColor"))
            }
    }
}

#Preview {
    ButtonsWithRoundedRectangle(image: ("circle", "ButtonYellowColor"))
}

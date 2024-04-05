import SwiftUI

struct ChoseGameModeButton: View {
    
    let text: String
    let imageOne: (String, String)?
    let imageTwo: (String, String)?
    
    var body: some View {
        HStack(alignment: .center) {
            if self.imageOne != nil {
                Group {
                    ZStack {
                        Image(systemName: imageOne!.0)
                            .foregroundStyle(Color(imageOne!.1))
                        
                        if self.imageTwo != nil {
                            Image(systemName: imageTwo!.0)
                                .foregroundStyle(Color(imageTwo!.1))
                                .padding(.leading, 40)
                        }
                    }
                    .font(.system(size: 36))
                }
            }
            
            Text(text)
                .font(.custom("Chalkboard SE",size: 36))
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
        .frame(width: 300, height: 80)
    }
}

//#Preview {
//    ChoseGameModeButton()
//}
#Preview {
    ChoseView()
}

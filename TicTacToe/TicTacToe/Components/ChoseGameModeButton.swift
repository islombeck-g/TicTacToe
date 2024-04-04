import SwiftUI

struct ChoseGameModeButton: View {
    
    let text: String
    let imageOne: (String, String)
    let imegeTwo: (String, String)?
    
    var body: some View {
        HStack {
            Group {
                
                Image(systemName: imageOne.0)
                    .foregroundStyle(Color(imageOne.1))
            }
            Text("")
        }
    }
}

//#Preview {
//    ChoseGameModeButton()
//}

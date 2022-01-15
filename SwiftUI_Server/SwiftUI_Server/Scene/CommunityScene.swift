import SwiftUI

struct CommunityScene: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var moveWrite = false
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("뒤로가기")
                    .font(.title)
                    .padding()
            })
            
            VStack {
                Button(action: {
                    moveWrite.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .font(.body)
                        .padding()
                        .fullScreenCover(isPresented: $moveWrite, content: {
                            WritePostScene(move: $moveWrite)
                        })
                })
            }
        }
    }
}

struct CommunityScene_Previews: PreviewProvider {
    static var previews: some View {
        CommunityScene()
    }
}

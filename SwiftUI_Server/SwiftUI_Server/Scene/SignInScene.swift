import SwiftUI

struct SignInScene: View {
    @ObservedObject private var viewModel = SignInViewModel()
    @State var moveSignup = false
    var body: some View {
        VStack {
            TextField("id를 입력해주세요", text: $viewModel.id)
            TextField("pw를 입력해주세요", text: $viewModel.pw)
            Button(action: {
                viewModel.login()
            }, label: {
                Text("로그인")
                    .padding()
                    .fullScreenCover(isPresented: $viewModel.isSuccess, content: {
                        CommunityScene()
                    })
            })
            Button(action: {
                moveSignup.toggle()
            }, label: {
                Text("회원가입")
                    .padding()
                    .fullScreenCover(isPresented: $moveSignup, content: {
                        SignUpScene()
                    })
            })
            
        }
    }
}

struct SignInScene_Preview: PreviewProvider {
    static var previews: some View {
        SignInScene()
    }
}

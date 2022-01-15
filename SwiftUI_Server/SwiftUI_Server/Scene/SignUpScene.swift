import SwiftUI

struct SignUpScene: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            TextField("name을 입력해주세요.", text: $viewModel.name)
            TextField("id를 입력해주세요.", text: $viewModel.id)
            TextField("pw를 입력해주세요.", text: $viewModel.pw)
            
            Button(action: {
                viewModel.signUp()
            }, label: {
                Text("회원가입")
            })
        }
    }
}

struct SignUpScene_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScene()
    }
}

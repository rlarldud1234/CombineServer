import SwiftUI

struct SignUpScene: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(2)
            })
            
            VStack {
                Spacer()
                TextField("name을 입력해주세요.", text: $viewModel.name)
                TextField("id를 입력해주세요.", text: $viewModel.id)
                TextField("pw를 입력해주세요.", text: $viewModel.pw)
                
                Button(action: {
                    viewModel.signUp()
                }, label: {
                    Text("회원가입")
                })
                Spacer()
            }
        }
    }
}

struct SignUpScene_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScene()
    }
}

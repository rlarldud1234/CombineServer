import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var id: String = ""
    @Published var pw: String = ""
    
    @Published var isSuccess = false
    @Published var errorMessage = String()
    
    private let api = Service()
    private var bag = Set<AnyCancellable>()
    
    func signUp() {
        api.signUp(name, id, pw).catch { error -> Empty<Void, Never> in
            self.errorMessage = NetworkError(error).message
            self.isSuccess = false
            return .init()
        }.sink(receiveValue: {
            print("success")
            self.isSuccess = true
        }).store(in: &bag)
    }
}

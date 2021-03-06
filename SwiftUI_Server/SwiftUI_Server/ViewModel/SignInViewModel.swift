import Foundation
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var id: String = ""
    @Published var pw: String = ""
    
    @Published var isSuccess = false
    @Published var errorMessage = String()
    
    private let api = Service()
    private var bag = Set<AnyCancellable>()
    
    func login() {
        api.signIn(id, pw).catch { error -> Empty<Void, Never> in
            self.errorMessage = NetworkError(error).message
            self.isSuccess = false
            return .init()
        }.sink(receiveValue: { [weak self] _ in
            print("login성공")
            self?.isSuccess = true
        }).store(in: &bag)
    }
    
}

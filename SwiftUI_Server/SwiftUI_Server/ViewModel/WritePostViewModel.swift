import Foundation
import Combine

class WritePostViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var isSuccess = true
    
    private let api = Service()
    private var bag = Set<AnyCancellable>()
    
    func write() {
        api.writePost(title, content).catch { error -> Empty<Void, Never> in
            print(NetworkError(error).message)
            self.isSuccess = true
            return .init()
        }.sink(receiveValue: {
            self.isSuccess = false
        }).store(in: &bag)
    }
}

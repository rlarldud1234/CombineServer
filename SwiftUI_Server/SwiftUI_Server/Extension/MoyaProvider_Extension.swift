import Foundation
import Moya
import CombineMoya
import Combine

extension MoyaProvider {
    
    func requestPublihser<T: Codable>(_ target: Target, _ model: T.Type) -> AnyPublisher<T, NetworkError> {
        return self.requestPublisher(target)
            .map(T.self)
            .map { return $0 }
            .mapError { NetworkError($0) }
            .eraseToAnyPublisher()
    }
    
    func requestVoidPublihser(_ target: Target) -> AnyPublisher<Void, NetworkError> {
        return self.requestPublisher(target)
            .map{ _ in return }
            .mapError { NetworkError($0) }
            .eraseToAnyPublisher()
    }
    
    func requestTokenPublisher(_ target: Target) -> AnyPublisher<Void, NetworkError> {
        return self.requestPublisher(target)
            .map(TokenModel.self)
            .map { if StoregateManager.shared.create($0) { return } }
            .mapError { NetworkError($0) }
            .eraseToAnyPublisher()
    }
    
}

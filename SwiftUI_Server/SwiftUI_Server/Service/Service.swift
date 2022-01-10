//
//  Service.swift
//  SwiftUI_Server
//
//  Created by 김기영 on 2022/01/11.
//

import Foundation
import CombineMoya
import Moya
import Combine

final class Service {
    
    let provider = MoyaProvider<API>()
}

extension MoyaProvider {
    
    func requestPublihser<T: Codable>(_ target: Target, _ model: T) -> AnyPublisher<T, NetworkError> {
        return self.requestPublisher(target)
            .map(T.self)
            .map { return $0 }
            .mapError { NetworkError($0) }
            .eraseToAnyPublisher()
    }
    
    func requestVoidPublihser(_ target: Target) -> AnyPublisher<Void, NetworkError> {
        return self.requestVoidPublihser(target)
            .map{ _ in return }
            .mapError { NetworkError($0) }
            .eraseToAnyPublisher()
    }
}

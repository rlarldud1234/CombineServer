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
    
    func signIn(_ id: String, _ pw: String) -> AnyPublisher<Void, NetworkError> {
        return provider.requestTokenPublisher(.signIn(id, pw))
    }
    
    func signUp(_ name: String, _ id: String, _ pw: String) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublihser(.signUp(name, id, pw))
    }
    
    func checkId(_ id: String) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublihser(.checkId(id))
    }
    
    func getPost() -> AnyPublisher<CommunityList, NetworkError> {
        return provider.requestPublihser(.getPost, CommunityList.self)
    }
    
    func writePost(_ title: String, _ content: String) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublihser(.writePost(title, content))
    }
    
    func deletePost(_ id: Int) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublihser(.deletePost(id))
    }
    
}

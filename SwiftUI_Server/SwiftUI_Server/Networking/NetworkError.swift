//
//  SetNetworkError.swift
//  SwiftUI_Server
//
//  Created by 김기영 on 2022/01/10.
//

import Foundation
import Moya

enum NetworkError: Int, Error {
    case ok = 200
    case createOk = 201
    case badRequest = 400
    case tokenError = 401
    case forbidden = 403
    case notFound = 404
    case notRes = 1
    case fail = 0
    
    init(_ error: MoyaError) {
        if error.response == nil {
            self = .notRes
        } else {
            let code = error.response!.statusCode
            let networkError = NetworkError(rawValue: code)
            self = networkError ?? .fail
        }
    }
    
    init(_ error: Error) {
        if let moyaErr = error as? MoyaError {
            self = NetworkError(moyaErr)
        } else {
            self = .fail
        }
    }
    
    var message: String {
        switch self {
        case .badRequest:
            return "잘못된 서버 요청"
        case .tokenError:
            return "토큰 오류"
        case .forbidden:
            return "권한 없음"
        case .notFound:
            return "게시물을 찾을 수 없음"
        case .notRes:
            return "Response가 안옴"
        default:
            return ""
        }
    }
}

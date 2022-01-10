//
//  TokenModel.swift
//  SwiftUI_Server
//
//  Created by 김기영 on 2022/01/11.
//

import Foundation

struct TokenModel: Codable {
    let access_token: String
    let refresh_token: String
}

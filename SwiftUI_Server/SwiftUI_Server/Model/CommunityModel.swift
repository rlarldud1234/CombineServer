//
//  CommunityModel.swift
//  SwiftUI_Server
//
//  Created by 김기영 on 2022/01/11.
//

import Foundation

struct CommunityModel: Codable {
    let id_pk: Int
    let name: String
    let title: String
    let content: String
    let created_at: String
}

struct CommunityList: Codable {
    let posts: [CommunityModel]
}

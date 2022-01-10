//
//  StorgeManager.swift
//  SwiftUI_Server
//
//  Created by 김기영 on 2022/01/11.
//

import Foundation
import Security

class StoregateManager {
    
    static let shared = StoregateManager()
    
    private let account = "SwiftUI_Server"
    private let service = Bundle.main.bundleIdentifier
    
    let keyChainQuery: NSDictionary = [
        kSecClass: kSecClassGenericPassword,
        kSecAttrService: Bundle.main.bundleIdentifier ?? "default",
        kSecAttrAccount: "SwiftUI_Server"
    ]
    
    func create(_ user: TokenModel) -> Bool {
        guard let data = try? JSONEncoder().encode(user) else { return false }
        
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service!,
            kSecAttrAccount: account,
            kSecValueData: data
        ]
        
        SecItemDelete(keyChainQuery)
        
        return SecItemAdd(keyChainQuery, nil) == errSecSuccess
        
    }
    
    func read() -> TokenModel? {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service!,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: CFTypeRef?
        let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
        
        if status == errSecSuccess {
            let retrievedData = dataTypeRef as! Data
            let value = try? JSONDecoder().decode(TokenModel.self, from: retrievedData)
            return value
        } else {
            return nil
        }
    }
    
    func delete() -> Bool {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service!,
            kSecAttrAccount: account
        ]
        
        return SecItemDelete(keyChainQuery) == noErr
    }
}

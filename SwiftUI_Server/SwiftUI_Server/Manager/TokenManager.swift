import Foundation

struct TokenManager {
    
    static var currentToken: TokenModel? {
        return StoregateManager.shared.read()
    }
    
    static func accessTokenUseful() -> Bool {
        if currentToken?.access_token != nil {
            return true
        } else {
            return false
        }
    }
    
    static func refreshTokenUseful() -> Bool {
        if currentToken?.refresh_token != nil {
            return true
        } else {
            return false
        }
    }
    
    static func removeToken() {
        StoregateManager.shared.delete()
    }
    
}

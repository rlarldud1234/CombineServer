import Foundation
import Moya

enum API {
    
    //Auth
    case signIn(_ id: String, _ pw: String)
    case signUp(_ name: String, _ id: String, _ pw: String)
    case checkId(_ id: String)
    
    //Community
    case getPost
    case writePost(_ title: String, _ content: String)
    case deletePost(_ id: Int)
}

extension API: TargetType {
    var baseURL: URL {
        URL(string: "http://13.125.241.176:8080")!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/login"
        case .signUp:
            return "/signup"
        case .checkId:
            return "/auth"
        case .getPost, .writePost:
            return "/post"
        case .deletePost(let id):
            return "/post/<\(id)>"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn, .signUp, .checkId, .writePost:
            return .post
        case .getPost:
            return .get
        case .deletePost:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .signIn(let id, let pw):
            return .requestParameters(parameters: ["id": id, "password": pw], encoding: JSONEncoding.prettyPrinted)
        case .signUp(let name, let id, let pw):
            return .requestParameters(parameters: ["name": name, "id": id, "password": pw], encoding: JSONEncoding.prettyPrinted)
        case .checkId(let id):
            return .requestParameters(parameters: ["id": id], encoding: JSONEncoding.prettyPrinted)
        case .writePost(let title, let content):
            return .requestParameters(parameters: ["title": title, "content": content], encoding: JSONEncoding.prettyPrinted)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        guard let token = TokenManager.currentToken?.access_token else { return nil }
        return ["Authorization" : "Bearer " + token]
    }
    
    
}

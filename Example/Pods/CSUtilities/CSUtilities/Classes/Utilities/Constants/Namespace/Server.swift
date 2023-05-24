//
//  Server.swift
//  CSConstants
//
//  Created by 于冬冬 on 2023/3/27.
//

public extension Constants {
    
    public struct Server {
        
        public static let domainEnviroment = Environment.getDefult()
        public static var baseURL: String {
            switch domainEnviroment {
            case .dev:
                return "http://192.168.50.193"
            case .mini:
                return "http://192.168.50.169"
            case .aws:
                return "http://zingy.land"
            case .ali:
                return "http://www.nebulaneutron.com:9527"
            }
        }
                
        public static var wsURL: String {
            switch domainEnviroment {
            case .dev:
                return "ws://192.168.50.193"
            case .mini:
                return "ws://192.168.50.169"
            case .aws:
                return "ws://zingy.land"
            case .ali:
                return "ws://www.nebulaneutron.com:9527"
            }
        }
        
        public static let schemeURL = "comesocial://"
    }
    
    public enum Environment: String {
        case dev
        case mini
        case aws
        case ali

        public func save() {
            UserDefaults.standard.set(self.rawValue, forKey: "Environment")
            UserDefaults.standard.synchronize()
        }
        
        static func getDefult() -> Environment {
#if DEBUG
            let value = UserDefaults.standard.object(forKey: "Environment") as? String ?? ""
            return Environment(rawValue: value) ?? .ali
#endif
            return .aws
        }
    }
}


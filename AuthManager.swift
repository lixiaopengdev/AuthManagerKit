//
//  AuthManager.swift
//  AuthManagerKit
//
//  Created by li on 5/22/23.
//

import Foundation
import ObjectMapper

class AuthManager: NSObject {
    // Create a static variable to hold the singleton instance
    static let shared = AuthManager()

    var isLoggedIn = false

    private override init() {
        // Private constructor to prevent creating new instances of AuthManager
    }

    func login(userInfo: AnyObject) {
        // Perform login logic here
        isLoggedIn = true
    }

    func logout() {
        // Perform logout logic here
        isLoggedIn = false
    }
    
    func userInfo() -> AnyObject {
        return "" as AnyObject
    }
    
    class func isLogin() -> Bool {
        return AuthManager.shared.isLoggedIn
    }

}

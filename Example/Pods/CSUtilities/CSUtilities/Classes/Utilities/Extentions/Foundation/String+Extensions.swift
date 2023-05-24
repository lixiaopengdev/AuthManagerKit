//
//  String+Extensions.swift
//  comesocial
//
//  Created by 于冬冬 on 2022/12/13.
//

import Foundation

// MARK: - NSString extensions

public extension String {
    func appendingPathComponent(_ str: String) -> String {
        return (self as NSString).appendingPathComponent(str)
    }
    
    func appendingPathExtension(_ str: String) -> String? {
        return (self as NSString).appendingPathExtension(str)
    }
    
    var deletingLastPathComponent: String {
        NSString(string: self).deletingLastPathComponent
    }

    var deletingPathExtension: String {
        NSString(string: self).deletingPathExtension
    }
    
    var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}

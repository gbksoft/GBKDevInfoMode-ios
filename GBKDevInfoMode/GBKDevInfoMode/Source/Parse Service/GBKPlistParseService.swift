//
//  GBKPlistParseService.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

class GBKPlistParseService {
    
    /// Dictionary form plist
    private var dictionary: NSDictionary
    
    /// Initialization
    ///
    /// - Parameter fileName: plist file name. (Default: "Info")
    init?(fileName: String = "Info") {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) else {
                return nil
        }
        
        self.dictionary = dictionary
    }
    
    /// Parse by key
    ///
    /// Parse only: String, Number, Bool, Date
    ///
    /// - Parameter key: key for parse
    /// - Returns: value in stirng
    func parse(key: String) -> String? {
        switch dictionary[key] {
        case .some(let value as Bool):
            return value ? "true" : "false"
        case .some(let value as NSNumber):
            return "\(value)"
        case .some(let value as Date):
            return "\(value.description)"
        case .some(let value as String):
            return value
        default: break
        }
        return nil
    }
    
    /// Get dictionary in formatted [String: String]
    ///
    /// - Returns: dictionary formatted
    func dictionaryFormatted() -> [String: String] {
        
        var dictionaryFormatted = [String: String]()
        
        for key in dictionary.allKeys {
            if let key = key as? String, let value = parse(key: key) {
                dictionaryFormatted[key] = value
            }
        }
        
        return dictionaryFormatted
    }
    
}

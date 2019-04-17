//
//  GBKDIMDevValueUserDefaultsModel.swift
//  GBKDevInfoMode
//
//  Created by zav on 4/2/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import Foundation

public struct GBKDIMDevValueUserDefaultsModel {
    var title: String
    var key: String
    var suiteName: String?
    
    /// Initialization
    ///
    /// - Parameters:
    ///   - title: title for value
    ///   - key: key for search value in User Defaults
    ///   - suiteName: name User Defaults. Passing nil will search the default search list.
    public init(title: String, key: String, suiteName: String? = nil) {
        self.title = title
        self.key = key
        self.suiteName = suiteName
    }
    
}

// MARK: - DevValueProtocol
extension GBKDIMDevValueUserDefaultsModel: DevValueProtocol {
    
    public var items: [GBKValueUIModel] {
        if let value = UserDefaults(suiteName: suiteName)?.object(forKey: key) {
            return [GBKValueUIModel(title: title, value: "\(value)")]
        }
        
        return []
    }
}


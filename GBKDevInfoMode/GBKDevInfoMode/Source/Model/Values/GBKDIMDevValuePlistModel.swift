//
//  GBKDIMDevValuePlistModel.swift
//  GBKDevInfoMode
//
//  Created by zav on 4/2/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import Foundation

public struct GBKDIMDevValuePlistModel {
    var title: String
    var key: String
    var nameFile: String
    
    /// Initialization
    ///
    /// - Parameters:
    ///   - title: title for value
    ///   - key: key for search in plist
    ///   - nameFile: file name plist
    public init(title: String, name key: String, inFile nameFile: String) {
        self.title = title
        self.key = key
        self.nameFile = nameFile
    }
}

// MARK: - DevValueProtocol
extension GBKDIMDevValuePlistModel: DevValueProtocol {
    
    public var items: [GBKValueUIModel] {
        if let value = GBKPlistParseService(fileName: nameFile)?.parse(key: key) {
            return [GBKValueUIModel(title: title, value: value)]
        }
        
        return []
    }
}

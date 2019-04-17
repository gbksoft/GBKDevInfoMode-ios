//
//  GBKDIMDevSectionPlistModel.swift
//  GBKDevInfoMode
//
//  Created by zav on 4/2/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import Foundation

public struct GBKDIMDevSectionPlistModel {
    
    var title: String
    var fileName: String
    
    /// Initialization
    ///
    /// - Parameters:
    ///   - title: title for section
    ///   - fileName: fileName for get plist
    public init(title: String, fromFile fileName: String) {
        self.title = title
        self.fileName = fileName
    }
}

// MARK: - DevSectionProtocol
extension GBKDIMDevSectionPlistModel: DevSectionProtocol {
    public var item: GBKSectionUIModel {
        
        var items: [GBKValueUIModel] = []
        
        guard let dictionaryFormatted = GBKPlistParseService(fileName: fileName)?.dictionaryFormatted() else {
            return GBKSectionUIModel(title: title, items: [])
        }
        
        for key in dictionaryFormatted.keys {
            if let value = dictionaryFormatted[key] {
                items.append(GBKValueUIModel(title: key, value: value))
            }
        }
        return GBKSectionUIModel(title: title, items: items)
    }
}

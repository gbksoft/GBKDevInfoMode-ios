//
//  GBKDIMDevSectionUserDefaultsModel.swift
//  GBKDevInfoMode
//
//  Created by zav on 4/2/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import Foundation

public struct GBKDIMDevSectionUserDefaultsModel {
    
    var title: String
    var suiteName: String
    
    /// Initialization
    ///
    /// - Parameters:
    ///   - title: title for section
    ///   - suiteName: name User Defaults
    public init(title: String, suiteName: String) {
        self.title = title
        self.suiteName = suiteName
    }
}

// MARK: - DevSectionProtocol
extension GBKDIMDevSectionUserDefaultsModel: DevSectionProtocol {
    public var item: GBKSectionUIModel {
        
        var items: [GBKValueUIModel] = []
        
        let dictionaryUserDefaults = UserDefaults(suiteName: suiteName)?.dictionaryRepresentation() ?? [:]
        
        for key in dictionaryUserDefaults.keys {
            if let value = dictionaryUserDefaults[key] {
                items.append(GBKValueUIModel(title: key, value: "\(value)"))
            }
        }
        
        return GBKSectionUIModel(title: title, items: items)
    }
}

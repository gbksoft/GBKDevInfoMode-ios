//
//  GBKDIMDevValueModel.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

public struct GBKDIMDevValueModel {
    var title: String
    var value: String
    var uniqueKey: String?
    
    /// Init
    ///
    /// - Parameters:
    ///   - title: name property
    ///   - value: value of property
    ///   - uniqueKey: unique key for update property
    public init(title: String, value: String, uniqueKey: String? = nil) {
        self.title = title
        self.value = value
        self.uniqueKey = uniqueKey
        
        guard let uniqueKey = uniqueKey else {
            return
        }
        
        if GBKDevInfoMode.shared.dynamicData[uniqueKey] == nil {
            GBKDevInfoMode.shared.dynamicData[uniqueKey] = value
        } else {
            debugPrint("GBKDevInfoMode - Error - not unique key")
        }
        
    }
}

// MARK: - DevValueProtocol
extension GBKDIMDevValueModel: DevValueProtocol {
    
    public var items: [GBKValueUIModel] {
        
        if let uniqueKey = uniqueKey, let value = GBKDevInfoMode.shared.dynamicData[uniqueKey] {
            return [GBKValueUIModel(title: title, value: value)]
        } else {
            return [GBKValueUIModel(title: title, value: value)]
        }
        
    }
}

//
//  GBKKeyAPIService.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

class GBKKeyAPIService {
    
    /// Key api environment in info.plist
    private static let APIEnvironment = "Key_type"
    
    /// Get model with Key API info
    static var model: GBKSectionUIModel? {
        var items: [GBKValueUIModel] = []
        
        guard let type = GBKPlistParseService()?.parse(key: GBKKeyAPIService.APIEnvironment) else {
            return nil
        }
        
        items.append(GBKValueUIModel(title: "Environment", value: type))
        
        guard let dictionaryFormatted = GBKPlistParseService(fileName: "Key-\(type)")?.dictionaryFormatted() else {
            return nil
        }
        
        for key in dictionaryFormatted.keys {
            if let value = dictionaryFormatted[key] {
                items.append(GBKValueUIModel(title: key, value: value))
            }
        }
        
        return GBKSectionUIModel(title: "API Keys", items: items)
    }
    
}

//
//  GBKUserDefaultsService.swift
//  GBKDevInfoMode
//
//  Created by zav on 4/1/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import Foundation

class GBKUserDefaultsService {
    
    /// Get model with google service info plist
    static var model: GBKSectionUIModel? {
        var items: [GBKValueUIModel] = []
        
        let dictionaryUserDefaults = UserDefaults.standard.dictionaryRepresentation()
        
        for key in dictionaryUserDefaults.keys {
            if let value = dictionaryUserDefaults[key] {
                items.append(GBKValueUIModel(title: key, value: "\(value)"))
            }
        }
        
        return GBKSectionUIModel(title: "User Defaults", items: items)
    }
    
}

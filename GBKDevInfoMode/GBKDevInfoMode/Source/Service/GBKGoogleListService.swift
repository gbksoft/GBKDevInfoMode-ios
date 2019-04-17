//
//  GBKGoogleListService.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

class GBKGoogleListService {
    
    /// Plist name for google info
    private static let plistName = "GoogleService-Info"
    
    /// Get model with google service info plist
    static var model: GBKSectionUIModel? {
        var items: [GBKValueUIModel] = []
        
        guard let dictionaryFormatted = GBKPlistParseService(fileName: GBKGoogleListService.plistName)?.dictionaryFormatted() else {
            return nil
        }
        
        for key in dictionaryFormatted.keys {
            if let value = dictionaryFormatted[key] {
                items.append(GBKValueUIModel(title: key, value: value))
            }
        }
        
        return GBKSectionUIModel(title: "Google Service Info", items: items)
    }
    
}

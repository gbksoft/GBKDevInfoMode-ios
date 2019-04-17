//
//  GBKFacebookListService.swift
//  GBKDevInfoMode
//
//  Created by zav on 4/16/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import Foundation

class GBKFacebookListService {
    
    /// Plist name for facebook info
    private static let plistName = "Info"
    
    /// Get model with facebook service info plist
    static var model: GBKSectionUIModel? {
        var items: [GBKValueUIModel] = []
        
        guard let dictionaryFormatted = GBKPlistParseService(fileName: GBKFacebookListService.plistName)?.dictionaryFormatted() else {
            return nil
        }
        
        for key in dictionaryFormatted.keys.filter({ $0 == "FacebookAppID" || $0 == "FacebookDisplayName" }) {
            if let value = dictionaryFormatted[key] {
                items.append(GBKValueUIModel(title: key, value: value))
            }
        }
        
        guard items.count > 0 else {
            return nil
        }
        
        return GBKSectionUIModel(title: "Facebook Service Info", items: items)
    }
    
}

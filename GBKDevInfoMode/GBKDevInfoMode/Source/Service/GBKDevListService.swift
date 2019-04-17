//
//  GBKDevListService.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

class GBKDevListService {
    
    /// Initialization
    init() {}
    
    /// Get list of GBKSectionUIModel
    func list(from sections: [GBKDevInfoMode.GBKDIMSectionType]) -> [GBKSectionUIModel] {
        
        var sectionItems: [GBKSectionUIModel] = []
        
        if sections.contains(.appInfo) {
            sectionItems.append(GBKAppInfoService.model)
        }
        
        if let model = GBKKeyAPIService.model, sections.contains(.keyAPI) {
            sectionItems.append(model)
        }
        
        if let model = GBKUserDefaultsService.model, sections.contains(.userDefaults) {
            sectionItems.append(model)
        }
        
        if let model = GBKFacebookListService.model, sections.contains(.facebookList) {
            sectionItems.append(model)
        }
        
        if let model = GBKGoogleListService.model, sections.contains(.googleList) {
            sectionItems.append(model)
        }
        
        return sectionItems
    }
}

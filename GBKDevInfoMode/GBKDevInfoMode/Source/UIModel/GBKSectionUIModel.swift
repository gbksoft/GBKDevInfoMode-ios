//
//  GBKSectionUIModel.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

public struct GBKSectionUIModel {
    
    var title: String
    var items: [GBKValueUIModel]
    
    /// Expanded for accordion UI
    var expanded: Bool = false
    
    /// Initialization
    init(title: String, items: [GBKValueUIModel]) {
        self.title = title
        self.items = items
    }
}

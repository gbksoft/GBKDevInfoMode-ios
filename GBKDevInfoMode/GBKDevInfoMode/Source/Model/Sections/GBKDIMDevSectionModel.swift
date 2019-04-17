//
//  GBKDIMDevSectionModel.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

public struct GBKDIMDevSectionModel {
    var title: String
    var items: [DevValueProtocol]
    
    /// Init
    ///
    /// - Parameters:
    ///   - title: title for section
    ///   - items: items for show in section
    public init(title: String, items: [DevValueProtocol]) {
        self.title = title
        self.items = items
    }
}

// MARK: - DevSectionProtocol
extension GBKDIMDevSectionModel: DevSectionProtocol {
    public var item: GBKSectionUIModel {
        var valueItems: [GBKValueUIModel] = []
        for value in items {
            valueItems.append(contentsOf: value.items)
        }
        return GBKSectionUIModel(title: title, items: valueItems)
    }
}

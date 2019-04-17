//
//  GBKDevInfoMode.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

/// Dev info mode
open class GBKDevInfoMode {
    
    /// Section
    ///
    /// - appInfo
    /// - keyAPI
    /// - userDefaults
    /// - facebookList
    /// - googleList
    /// - custom
    public enum GBKDIMSectionType {
        case appInfo /// base app info: (app name, bundle, app version, app build, OS)
        case keyAPI /// key api (environment from info.plist, all values from Key_\(environment).plist)
        case userDefaults /// all user defaults
        case facebookList /// Facebook info from info.plist
        case googleList /// GoogleService-Info.plist
        case custom /// custom property list
    }
    
    /// Is enabled framework
    private var isEnabled: Bool = false
    
    /// Is setuped framework
    private var isSetup: Bool = false
    
    /// Items of SectionUIModel
    private(set) var items: [GBKSectionUIModel] = []
    
    /// Items of section type
    private var sections: [GBKDIMSectionType] = []
    
    /// Items of dynamicSections
    private var dynamicSections: [DevSectionProtocol] = []
    
    /// Automatic launch by shake
    public var automaticLaunchByShake: Bool = true
    
    /// Dynamic data, unique keys-value
    var dynamicData: [String: String] = [:]
    
    /// Singleton
    public static let shared = GBKDevInfoMode()
    
    /// Initialization
    private init() {}
    
    /// Setup framework
    ///
    /// - Parameters:
    ///   - isEnabled: is enabled framework
    ///   - sections: array of type section. Default: [.appInfo, .keyAPI]
    public func setup(isEnabled: Bool, sections: [GBKDIMSectionType] = [.appInfo, .keyAPI]) {
        guard !isSetup else {
            debugPrint("GBKDevInfoMode - Error - is setuped")
            return
        }
        
        self.isSetup = true
        self.isEnabled = isEnabled
        self.sections = sections
    }
    
    /// Manual launch dev info mode
    public func manualLaunch() {
        guard isEnabled else {
            debugPrint("GBKDevInfoMode - Error - need to enabled")
            return
        }
        if isEnabled {
            openList()
        }
    }
    
    /// Add custom value
    ///
    /// - Parameter section: section info model
    public func add(section: DevSectionProtocol) {
        guard isSetup else {
            debugPrint("GBKDevInfoMode - Error - need setup GBKDevInfoMode")
            return
        }
        
        guard sections.contains(.custom) else {
            debugPrint("GBKDevInfoMode - Error - need setup .custom type")
            return
        }
        
        self.dynamicSections.append(section)
    }

    /// Update custom value
    ///
    /// - Parameters:
    ///   - value: new value for update
    ///   - key: key for update
    public func update(value: String, in key: String) {
        guard isSetup else {
            debugPrint("GBKDevInfoMode - Error - need setup GBKDevInfoMode")
            return
        }
        
        guard sections.contains(.custom) else {
            debugPrint("GBKDevInfoMode - Error - need setup .custom type")
            return
        }
        
        guard dynamicData[key] != nil else {
            debugPrint("GBKDevInfoMode - Error - not this key")
            return
        }
        
        self.dynamicData[key] = value
    }

    /// Open list
    func openList() {
        items = GBKDevListService().list(from: sections)
        for section in dynamicSections {
            let item = section.item
            
            if item.items.count == 0 {
                debugPrint("GBKDevInfoMode - Error - section items is empty")
            } else {
                items.append(item)
            }

        }
        GBKListRouter.open()
    }
    
    /// Detected shake
    func motionShake() {
        if isEnabled && automaticLaunchByShake {
            openList()
        }
    }
}


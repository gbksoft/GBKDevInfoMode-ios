//
//  GBKAppInfoService.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import Foundation

class GBKAppInfoService {
    
    /// Get section with app info
    static var model: GBKSectionUIModel {
        var items: [GBKValueUIModel] = []
        
        let appInfoService = GBKAppInfoService()
        
        items.append(GBKValueUIModel(title: "App name", value: appInfoService.executable))
        items.append(GBKValueUIModel(title: "Bundle", value: appInfoService.bundle))
        items.append(GBKValueUIModel(title: "App version", value: appInfoService.appVersion))
        items.append(GBKValueUIModel(title: "App build", value:appInfoService.appBuild))
        items.append(GBKValueUIModel(title: "OS", value: appInfoService.osNameVersion))
        
        return GBKSectionUIModel(title: "App Info", items: items)
    }
    
    /// Initialization
    private init() {}
    
    private var executable: String {
        return Bundle.main.infoDictionary?[kCFBundleExecutableKey as String] as? String ?? "Unknown"
    }
    
    private var bundle: String {
        return Bundle.main.infoDictionary?[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
    }
    
    private var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }
    
    private var appBuild: String {
        return Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String ?? "Unknown"
    }
    
    private var osNameVersion: String {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        let versionString = "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
        
        let osName: String = {
            #if os(iOS)
                return "iOS"
            #else
                return "Unknown"
            #endif
        }()
        
        return "\(osName) \(versionString)"
        
    }
    
}

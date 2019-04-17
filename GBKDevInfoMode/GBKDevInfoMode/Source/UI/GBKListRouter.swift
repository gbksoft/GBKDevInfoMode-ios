//
//  GBKListRouter.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import UIKit

/// Class for open List View Controller
class GBKListRouter {
    
    /// Present ListViewController to topViewController
    static func open() {
        
        let topViewController = GBKListRouter.topViewController()
        
        if !(topViewController is GBKListViewController) {
            let listViewController = GBKListViewController(nibName: "GBKListViewController", bundle: Bundle(for: GBKListViewController.self))
            GBKListRouter.topViewController()?.present(listViewController, animated: true, completion: nil)
        }
        
    }
    
    /// Get top view controller
    static private func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        if base == nil {
            return UIApplication.shared.delegate?.window??.rootViewController
        }
        return base
    }
}

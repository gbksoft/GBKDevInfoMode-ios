//
//  Extension+UIWindow.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import UIKit

/// Extension for detected shake phone
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            GBKDevInfoMode.shared.motionShake()
        }
        super.motionEnded(motion, with: event)
    }
}

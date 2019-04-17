//
//  GBKAlertController.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/6/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import UIKit

class GBKAlertController {
    
    /// Initialization
    init() {}
    
    func showSaved(to controller: UIViewController, title: String, value: String) {
        let alert = UIAlertController(title: "Saved \(title)", message: value, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}

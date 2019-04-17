//
//  GBKValueInfoTableViewCell.swift
//  GBKDevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import UIKit

class GBKValueInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
        
        baseView.layer.borderColor = UIColor(red: 89.0/255.0, green: 89.0/255.0, blue: 89.0/255.0, alpha: 1.0).cgColor
        baseView.layer.borderWidth = 1.0
        baseView.clipsToBounds = true
    }

    /// Update cell
    ///
    /// - Parameter model: GBKValueUIModel
    func update(model: GBKValueUIModel) {
        if model.title.count > 0 {
            titleLabel.text = model.title + ":"
        } else {
            titleLabel.text = model.title
        }
        
        valueLabel.text = model.value
    }

}

//
//  GBKSectionInfoTableViewCell.swift
//  DevInfoMode
//
//  Created by mac-25 on 3/5/18.
//  Copyright © 2018 gbksoft. All rights reserved.
//

import UIKit

class GBKSectionInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
        
        baseView.layer.borderColor = UIColor(red: 99.0/255.0, green: 101.0/255.0, blue: 113.0/255.0, alpha: 1.0).cgColor
        baseView.layer.borderWidth = 1.0
        baseView.clipsToBounds = true
    }

    /// Update cell
    ///
    /// - Parameter model: GBKSectionUIModel
    func update(model: GBKSectionUIModel) {
        titleLabel.text = model.title.uppercased()
        arrowImageView.transform = model.expanded ? CGAffineTransform(rotationAngle: .pi) : CGAffineTransform.identity
    }

}

//
//  FilterTableViewCell.swift
//  Yelp-iOS
//
//  Created by Keith Smyth on 27/10/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import UIKit

protocol FilterTableViewCellDelegate: class {
    func filterTableViewCell(filterCell: FilterTableViewCell, didChangeValue value: Bool)
}

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    weak var delegate: FilterTableViewCellDelegate?
    
    @IBAction func onSwitchValueChanged(_ sender: AnyObject) {
        delegate?.filterTableViewCell(filterCell: self, didChangeValue: toggleSwitch.isOn)
    }
}

//
//  CountryCell.swift
//  Cities
//
//  Created by Камилла Бадаева on 19/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    static let reuseIdentifier = "CountryCell"
    
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

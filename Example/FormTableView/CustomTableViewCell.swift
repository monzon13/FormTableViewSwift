//
//  CustomTableViewCell.swift
//  FormTableView_Example
//
//  Created by José Miguel on 19/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import FormTableView

class CustomTableViewCell: UITableViewCell {
    static let ID: String = "CustomTableViewCell"
    static let estimateheigth: CGFloat = 100
    
    @IBOutlet weak var formView: FormView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    
}

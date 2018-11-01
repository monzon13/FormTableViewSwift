//
//  CustomTableViewCell.swift
//  FormTableView_Example
//
//  Created by jmhdevep on 10/19/2018.
//  Copyright (c) 2018 jmhdevep. All rights reserved.
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
        _ = FormViewConnector.init(view: formView)
        
        
    }    
}

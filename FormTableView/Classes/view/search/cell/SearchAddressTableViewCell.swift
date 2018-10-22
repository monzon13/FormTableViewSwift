//
//  SearchAddressTableViewCell.swift
//  FormTableView
//
//  Created by José Miguel on 22/10/2018.
//

import UIKit

class SearchAddressTableViewCell: UITableViewCell {

    static let ID = "SearchAddressTableViewCell"
    static let estimateheigth: CGFloat = 60
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    func configure(_ address: Address?) {
        guard let address = address else {
            return
        }
        
        self.labelTitle.text = address.title
        self.labelSubtitle.text = address.subtitle
    }
}

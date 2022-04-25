//
//  BaseTableViewCell.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        applyStyling()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier: String {
        String(describing: self)
    }
    
    func applyStyling() {
        
    }
}

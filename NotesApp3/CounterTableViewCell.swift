//
//  CounterTableViewCell.swift
//  NotesApp3
//
//  Created by ivan piskun on 3/12/19.
//  Copyright © 2019 ivan piskun. All rights reserved.
//

import Foundation
import UIKit

class CounterTableViewCell: UITableViewCell {

// MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


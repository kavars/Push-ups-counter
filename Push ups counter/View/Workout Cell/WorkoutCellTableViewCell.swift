//
//  WorkoutCellTableViewCell.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import UIKit

class WorkoutCellTableViewCell: UITableViewCell, WorkoutCellProtocol {
    
    var date: String? {
        get {
            return dateLabel.text
        }
        set {
            dateLabel.text = newValue
        }
    }
    
    var count: String? {
        get {
            return countLabel.text
        }
        set {
            countLabel.text = newValue
        }
    }
    

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

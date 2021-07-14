//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Luka Babovic on 10/07/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var MyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

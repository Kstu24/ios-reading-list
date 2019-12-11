//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Kevin Stewart on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    var delegate: BookTableViewCellDelegate?
    
    //MARK: - IBOutlets
    
    @IBOutlet var bookTitleLabel: UILabel!
        @IBOutlet var checkedButton: UIButton!

    //MARK: - IBActions

    @IBAction func checkedButtonTapped(_ sender: UIButton) {
        checkedButton.toggleHasBeenRead(for cell: BookTableViewCell)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

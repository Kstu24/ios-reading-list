//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Kevin Stewart on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}

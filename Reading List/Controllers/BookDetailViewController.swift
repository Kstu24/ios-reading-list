//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Kevin Stewart on 12/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var book: Book?
    
    //MARK: - IBOutlets
    @IBOutlet var bookTitleLabel: UITextField!
    @IBOutlet var reasonToReadTextView: UITextView!
    
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    private func updateViews() {
        guard let book = book else { return }
        bookTitleLabel.text = book.title
                   if book.hasBeenRead {
                       let image = UIImage(named: "checked")
                       checkedButtonTapped.setImage(image, for: .normal)
                   } else {
                       let image = UIImage(named: "unchecked")
                       checkedButtonTapped.setImage(image, for: .normal)
                   }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

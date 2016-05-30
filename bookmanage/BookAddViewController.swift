//
//  BookAddViewController.swift
//  bookmanage
//
//  Created by Ocean on 5/29/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import UIKit

class BookAddViewController: UITableViewController {

    @IBOutlet weak var bookid: UITextField!
    @IBOutlet weak var bookname: UITextField!
    @IBOutlet weak var booklocal: UITextField!
    @IBOutlet weak var bookintr: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
    
    @IBAction func backAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addBookAction(sender: AnyObject) {
        let book = BookModel()
//        book.bookid = bookid.text!
        book.bookname = bookname.text!
        book.booklocal = booklocal.text!
        book.bookintr = bookintr.text
        
        DBTools.savebook(book)
        
        self.dismissViewControllerAnimated(true) { 
            
        }
    
    }

}

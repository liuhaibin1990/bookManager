//
//  BookUpdateViewController.swift
//  bookmanage
//
//  Created by Ocean on 5/30/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import UIKit

class BookUpdateViewController: UITableViewController {

    var book : BookModel? = BookModel()
    
    @IBOutlet weak var bookid: UITextField!
    
    @IBOutlet weak var bookname: UITextField!
    
    @IBOutlet weak var studetid: UITextField!
    
    @IBOutlet weak var booklocal: UITextField!
    
    @IBOutlet weak var bookintr: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.bookid.text = book?.bookid
        self.bookname.text = book?.bookname
        self.studetid.text = book?.studentid
        self.booklocal.text = book?.booklocal
        self.bookintr.text = book?.bookintr
    }

    @IBAction func save(sender: AnyObject) {
        let newbook : BookModel? = BookModel()
        newbook?.bookid = self.bookid.text!
        newbook?.bookname = self.bookname.text!
        newbook?.booklocal = self.booklocal.text!
        newbook?.bookintr = self.bookintr.text
        newbook?.studentid = self.studetid.text!
        
        DBTools.savebook(newbook!)
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

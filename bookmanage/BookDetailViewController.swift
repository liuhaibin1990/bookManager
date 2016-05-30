//
//  BookDetailViewController.swift
//  bookmanage
//
//  Created by Ocean on 5/29/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import UIKit

class BookDetailViewController: UITableViewController {
    
    @IBOutlet weak var bookid: UITextField!
    
    @IBOutlet weak var bookname: UITextField!
    
    @IBOutlet weak var studetid: UITextField!
    
    @IBOutlet weak var booklocal: UITextField!
    
    @IBOutlet weak var bookintr: UITextView!
    var book : BookModel?  = BookModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let Array = DBTools.quarybook(book!)
        if Array.count > 0 {
            book = Array[0] as? BookModel
        }
        
        
        self.bookid.text = book?.bookid
        self.bookname.text = book?.bookname
        self.studetid.text = book?.studentid
        self.booklocal.text = book?.booklocal
        self.bookintr.text = book?.bookintr
        
//        self.tableView.reloadData()
    }
    
    
    
    @IBAction func update(sender: AnyObject) {
        self.performSegueWithIdentifier("updatebook", sender: book)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "updatebook" {
            let controller = segue.destinationViewController as! UINavigationController
            let updatecontroller = controller.viewControllers[0] as! BookUpdateViewController
            updatecontroller.book = sender as? BookModel
        }
    }
    
    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}

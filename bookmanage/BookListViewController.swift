//
//  BookListViewController.swift
//  bookmanage
//
//  Created by Ocean on 5/29/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import UIKit

class BookListViewController: UITableViewController {

    var booklist = NSMutableArray()
    
    override func viewWillAppear(animated: Bool) {
        var book = BookModel()
//        DBTools.savebook(book)
        
        booklist = DBTools.quarybook(book)
        
        if booklist.count > 0 {
            book = booklist[0] as! BookModel
            print(book.bookid)
        }

        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
   
        
    }
    
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return booklist.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("roomlist", forIndexPath: indexPath) as! BookViewCell
        
        var book = BookModel()
        book = booklist[indexPath.row] as! BookModel
        
        cell.book = book
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("detail", sender: booklist[indexPath.row])
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "detail"{
                let controller = segue.destinationViewController as! BookDetailViewController
                    controller.book = sender as? BookModel
            }
        }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        var book = BookModel()
       book =  booklist[indexPath.row] as! BookModel
        book.isdelete = "1"
       DBTools.savebook(book)
        booklist.removeObjectAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        
    }
}

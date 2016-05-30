//
//  BookViewCell.swift
//  bookmanage
//
//  Created by Ocean on 5/29/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import UIKit

class BookViewCell: UITableViewCell {

    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookIntro: UILabel!
    
    var book : BookModel{

        get{
            return self.book
        }
        set{
            self.bookName.text = newValue.bookname
            self.bookIntro.text = newValue.bookintr
        }
    }
    
    
    
 
}

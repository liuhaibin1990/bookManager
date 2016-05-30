//
//  DBTools.swift
//  bookmanage
//
//  Created by Ocean on 5/26/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import UIKit

let documents = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)

class DBTools: NSObject {

   class func savebook(book:BookModel) -> Bool{
        
        let fileURL = documents.URLByAppendingPathComponent("bookmanager.sqlite")
        
         let database = FMDatabase(path: fileURL.path)
        
        if !database.open() {
            print("Unable to open database")
            return false
        }
    
        var isData = false
        
        do {
            
            do {
                try database.executeUpdate("create table book(bookid integer PRIMARY KEY autoincrement, bookname text, bookintr text," +
                    " booklocal text,studentid text,isdelete text)", values: nil)
            } catch {
                print("表已存在")
            }
            
            
            
            let rs = try database.executeQuery("select bookid, bookname, bookintr from book where bookid = ?", values: [book.bookid])
            while rs.next() {
                isData = true
            }
            
            //表里有数据更新没数据插入
            if isData {
                let upDateStr = "update book set bookname = ?, bookintr = ?,booklocal = ?,studentid = ?,isdelete = ? where bookid = ?"
                 try database.executeUpdate(upDateStr, values: [book.bookname, book.bookintr,book.booklocal,book.studentid,book.isdelete,book.bookid])
            }else{
                // ["00001", "Swift language", "Swift 教程","东北区","65231201","0"]
                 try database.executeUpdate("insert into book (bookname, bookintr,booklocal,studentid,isdelete) values ( ?, ?, ?, ?, ?)", values: [book.bookname, book.bookintr,book.booklocal,book.studentid,book.isdelete])
                
            }
            

        } catch let error as NSError {
            print("failed: \(error.localizedDescription)")
            isData = false
        }
        
        database.close()
        return isData
    }
    
    class func quarybook(book:BookModel) -> NSMutableArray {
        
         let booklist = NSMutableArray()
        
        let fileURL = documents.URLByAppendingPathComponent("bookmanager.sqlite")
    
        let database = FMDatabase(path: fileURL.path)
        
        if !database.open() {
            print("Unable to open database")
            return booklist
        }
       
    
        do{
            var querysql = "select * from book where 1=1 and isdelete != '1'"
            if book.bookid != "" {
                querysql += " and bookid = \(book.bookid)"
            }

            
            let rs = try database.executeQuery(querysql, values: nil)
            
            
            
            while rs.next() {
                let book = BookModel()
                book.bookid = rs.stringForColumn("bookid")
                book.bookname = rs.stringForColumn("bookname")
                book.bookintr = rs.stringForColumn("bookintr")
                book.booklocal = rs.stringForColumn("booklocal")
                book.studentid = rs.stringForColumn("studentid")
                book.isdelete = rs.stringForColumn("isdelete")
                booklist.addObject(book)
                }
            
        }catch let error as NSError {
            print("failed: \(error.localizedDescription)")
        
        }
    
        database.close()
        return booklist
    }
    
    
    
}

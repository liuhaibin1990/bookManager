//
//  Utility.swift
//  bookmanage
//
//  Created by Ocean on 5/26/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import Foundation
import UIKit

class Utilty: NSObject {
    
    class func saveToDefaults(value:String,key:String){
       let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key)
        defaults.synchronize()
    }
    
    class func defaultsForKey(key:String) -> AnyObject?{
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.objectForKey(key)
    }
    
    class func removeForKey(Key:String){
         let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.removeObjectForKey(Key)
    }
    
    
    class func viewforStoryboard(name:String,viewName:String) -> UIViewController{
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(viewName)
        return viewController
        
    }
}


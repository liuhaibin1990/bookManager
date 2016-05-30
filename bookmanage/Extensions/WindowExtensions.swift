//
//  WindowExtensions.swift
//  bookmanage
//
//  Created by Ocean on 5/26/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow{
    
    func switchRootViewController(){
        if Utilty.defaultsForKey("username") != nil {
            self.rootViewController = Utilty.viewforStoryboard("Main", viewName: "tabbarView")
        }else{
            self.rootViewController = Utilty.viewforStoryboard("Main", viewName: "LoginViewController")
        }

    }
    
}

//
//  LoginViewController.swift
//  bookmanage
//
//  Created by Ocean on 5/26/16.
//  Copyright © 2016 Ocean. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
    @IBAction func loginAction(sender: AnyObject) {
        let window = UIApplication.sharedApplication().windows.last
        window?.rootViewController = Utilty.viewforStoryboard("Main", viewName: "tabbarView")
    }

}

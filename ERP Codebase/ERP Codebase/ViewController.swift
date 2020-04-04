//
//  ViewController.swift
//  ERP Codebase
//
//  Created by Frank Castle on 04/04/20.
//  Copyright © 2020 Code Bew. All rights reserved.
//

import UIKit
import SwiftUI

let globalUsers = [
    User(name: "iAlpha", email: "gaganmj23@gmail.com") ,
    User(name: "Apoorva", email: "apoorva.ak008@gmail.com")
]


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: LoginUserInterface())
    }

}


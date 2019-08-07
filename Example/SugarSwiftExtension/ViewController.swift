//
//  ViewController.swift
//  SugarSwiftExtension
//
//  Created by yu.xieyu on 08/07/2019.
//  Copyright (c) 2019 yu.xieyu. All rights reserved.
//

import UIKit
import SugarSwiftExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a:Int = 123
        print(a.digitArray[1...2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


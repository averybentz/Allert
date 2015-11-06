//
//  SelectedMenuViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-11.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class SelectedMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Change nav bar colour
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

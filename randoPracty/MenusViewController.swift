//
//  MenusViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-10.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class MenusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var menusTableView: UITableView!
    
    //Array to hold menus
    var menuItems:NSMutableArray = ["The Keg", "Montana's Cook House", "Jack Astors", "Milestones", "Moxies", "Kelsey's", "Boston Pizza"]
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //TableView needed methods:
    //Data sources
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    //Delegates
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = menusTableView.dequeueReusableCellWithIdentifier("menusCell", forIndexPath: indexPath) as! MenusTableViewCell
        
        //Set label
        cell.menusLabel.text = menuItems[indexPath.row] as? String
        
        return cell
    }
}

//
//  NotificationsViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-05.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var notificationsTableView: UITableView!
    
    var notifications: NSMutableArray = ["Welcome to Allert. Hopefully you enjoy our software! Please share with your friends!"]
    var dates: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Change nav bar colour
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
        
        //Get current date when VC opens
        let date = NSDate()
        
        let formatter = NSDateFormatter()
        //Set formatter style to e.g.(Sunday, August 23, 2015)
        formatter.dateStyle = .FullStyle
        //Pass in current date
        let datePrint = formatter.stringFromDate(date)
        
        //If object at index 0 in dates array has not been set yet, set it add the current day to that index in the dates array
        if(dates.count == 0){
            dates.addObject(datePrint)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = notificationsTableView.dequeueReusableCellWithIdentifier("notificationsCell") as! NotificationsTableViewCell
        
        //Set notificationsLabel of cells
        cell.notificationsLabel.text = notifications[indexPath.row] as? String
        //Set datesLabel of cells
        cell.datesLabel.text = dates[indexPath.row] as? String
        
        return cell
    }
}

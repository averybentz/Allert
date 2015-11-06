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
    
    var notifications: NSMutableArray = [] //Array for notifications
    var dates: NSMutableArray = [] //Array for notifications corresponding date
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Set up NSUserDefaults to hold notifications "stuff"
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(notifications, forKey: "notificationsKey")//Holds notifications
        userDefaults.setObject(dates, forKey: "datesKey")//Holds dates
        userDefaults.synchronize()
        
        //Change nav bar colour
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
        
        //Get current date when VC opens
        let date = NSDate()
        
        let formatter = NSDateFormatter()
        //Set formatter style to e.g.(Sunday, August 23, 2015)
        formatter.dateStyle = .FullStyle
        //Pass in current date
        let postDatePrint = formatter.stringFromDate(date)
        
        //Add initial Notification
        if(notifications.count == 0){
            notifications.addObject("Welcome to Allert. Hopefully you enjoy our software! Please share with your friends!")
            //Add it to saved array via NSUserDefaults
            userDefaults.setObject(notifications, forKey: "notificationsKey")
            userDefaults.synchronize()
            
            /*
             TEST:
            print(userDefaults.objectForKey("notificationsKey"))
            */
        }
        //Add initial, corresponding date
        if(dates.count == 0){
            dates.addObject(postDatePrint)
            //Add it to saved array via NSUserDefaults
            userDefaults.setObject(notifications, forKey: "datesKey")
            userDefaults.synchronize()
            
            /*
            TEST:
            print(userDefaults.objectForKey("notificationsKey"))
            */
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

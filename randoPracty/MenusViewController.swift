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
    var menuItems:NSMutableArray = [""]
    //TEMPORARY VAR: Kelsey's menu array
    var kelseysMenu = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change nav bar colour 
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
        
        /****
        AWS S3- Retrieving Menus
        TEMPORARY: First Menu Work "Kelsey's"
        ****/

        //Construct the NSURL for the download location.
        let downloadingFilePath = NSTemporaryDirectory().stringByAppendingString("downloadedFirstMenu")
        let downloadingFileURL = NSURL.fileURLWithPath(downloadingFilePath)
        
        //Construct the download request.
        let downloadRequest = AWSS3TransferManagerDownloadRequest()
        downloadRequest.bucket = "allert"
        downloadRequest.key = "Kelsey's"// File name on s3
        downloadRequest.downloadingFileURL = downloadingFileURL
        
        //Download the file
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        transferManager.download(downloadRequest)
        
        //Add s3 content to menu(s)
        do {
        kelseysMenu = try NSString(contentsOfFile: downloadingFilePath, encoding: NSUTF8StringEncoding) as String
        
        } catch {
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /****
    TableView needed methods:
    ****/
    
    //Data sources
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    //Delegates
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = menusTableView.dequeueReusableCellWithIdentifier("menusCell", forIndexPath: indexPath) as! MenusTableViewCell
        
        //Set label
        cell.menusLabel.text = "FIX ME:"
        
        return cell
    }
}

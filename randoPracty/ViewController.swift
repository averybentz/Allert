//
//  ViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-01.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Array to hold csv menus
    var menus:NSMutableArray = []
    
    var thisMenuItem:NSString = ""
    //Array to hold ingredients
    var ingredients:NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let myFirstMenu = NSBundle.mainBundle().pathForResource("FirstMenu", ofType: "csv")
        //Add menu to menus
        menus.addObject(myFirstMenu!)
        let mySecondMenu = NSBundle.mainBundle().pathForResource("SecondMenu", ofType: "csv")
        menus.addObject(mySecondMenu!)
        
        /*
        //Check if 3 main methods work
        let firstMenuItems = self.grabMenuItems(menus.objectAtIndex(0) as! String)
        let firstSubMenu = self.grabSubMenu(menus.objectAtIndex(0) as! String)
        let firstMenuIngredients = self.grabIngredients(menus.objectAtIndex(0) as! String)
        let firstMenuPrices = self.grabprices(menus.objectAtIndex(0) as! String)
        
        //Works like a charm!
*/
        /*
        //Check if main methods work for different menus (e.g. FirstMenu and SecondMenu)
        let firstMenuItems = self.grabMenuItems(menus.objectAtIndex(0) as! String)
        println(firstMenuItems)
        let secondMenuItems = self.grabMenuItems(menus.objectAtIndex(1) as! String)
        println(secondMenuItems)
        
        //Works fine!
*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    //Function that gets menu items names and adds them to menuItems array
    func grabMenuItems(thisMenu:String) -> NSMutableArray{
        
        let thisMenuContents: NSString = try! String(contentsOfFile: thisMenu, encoding: NSUTF8StringEncoding)
        let allElements = thisMenuContents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as NSArray
        
        //Array to capture initial menu items and their information
        let menuItemsInfo:NSMutableArray = []
        
        //Create menuItemsInfo Array that will hold all menu items main information separately
        for var index=0; index<allElements.count; ++index{
            //Check if object is empty
            //If element is empty
            if (allElements.objectAtIndex(index) as! String == ""){
                //Don't add element to menuItemsInfo Array
            }
                
            else{
                //Add element to menuItemsInfo Array
                menuItemsInfo.addObject(allElements.objectAtIndex(index))
            }
        }
        
        //Array to hold menu items
        let menuItems:NSMutableArray = []
        
        //Iterate through each element of menuItemsInfo array, set that element as it's own menu item (thisMenuItem), and then finally add the menu item name to the menuItems array
        for var index=0; index<menuItemsInfo.count; ++index{
            //create var for element at index in menuItemsInfo
            thisMenuItem = menuItemsInfo.objectAtIndex(index) as! NSString
            //Array to hold all the information seprated into their own items
            let separatedItems = thisMenuItem.componentsSeparatedByString("/") as NSArray
            
            //Add elements (menu titles which are located at index 0) to menuItemsArray
            menuItems.addObject(separatedItems.objectAtIndex(0))
        }
        return menuItems
    }
    
    
    
    
    
    
    /****
    3 Main functions:
    ****/
    //Function that get sub menu informatiom and adds them to subMenu array
    func grabSubMenu(thisMenu:String) -> NSMutableArray{
        
        let thisMenuContents: NSString = try! String(contentsOfFile: thisMenu, encoding: NSUTF8StringEncoding)
        let allElements = thisMenuContents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as NSArray
        
        //Array to capture initial menu items and their information
        let menuItemsInfo:NSMutableArray = []
        
        //Create menuItemsInfo Array that will hold all menu items main information separately
        for var index=0; index<allElements.count; ++index{
            //Check if object is empty
            //If element is empty
            if (allElements.objectAtIndex(index) as! String == ""){
                //Don't add element to menuItemsInfo Array
            }
                
            else{
                //Add element to menuItemsInfo Array
                menuItemsInfo.addObject(allElements.objectAtIndex(index))
            }
        }
        
        //Array to hold sub menu information
        let subMenu:NSMutableArray = []
        
        //Iterate through each element of menuItemsInfo array, set that element as it's own menu item (thisMenuItem), and then finally add the submenu name to the subMenu array
        for var index=0; index<menuItemsInfo.count; ++index{
            //create var for element at index in menuItemsInfo
            thisMenuItem = menuItemsInfo.objectAtIndex(index) as! NSString
            //Array to hold all the information seprated into their own items
            let separatedItems = thisMenuItem.componentsSeparatedByString("/") as NSArray
            //Add elements (sub menu which are located at index 1) to subMenu
            subMenu.addObject(separatedItems.objectAtIndex(1))
        }
        return subMenu
    }
    
    //Function that grabs ingredients and adds them to ingredients array
    func grabIngredients(thisMenu:String) -> NSMutableArray{
        
        let thisMenuContents: NSString = try! String(contentsOfFile: thisMenu, encoding: NSUTF8StringEncoding)
        let allElements = thisMenuContents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as NSArray
        
        //Array to capture initial menu items and their information
        let menuItemsInfo:NSMutableArray = []
        
        //Create menuItemsInfo Array that will hold all menu items main information separately
        for var index=0; index<allElements.count; ++index{
            //Check if object is empty
            //If element is empty
            if (allElements.objectAtIndex(index) as! String == ""){
                //Don't add element to menuItemsInfo Array
            }
                
            else{
                //Add element to menuItemsInfo Array
                menuItemsInfo.addObject(allElements.objectAtIndex(index))
            }
        }
        
        //Iterate through each element of menuItemsInfo array, set that element as it's own menu item (thisMenuItem), and then finally add the ingredients to the ingredients array
        for var index=0; index<menuItemsInfo.count; ++index{
            //create var for element at index in menuItemsInfo
            thisMenuItem = menuItemsInfo.objectAtIndex(index) as! NSString
            //Array to hold all the information seprated into their own items
            let separatedItems = thisMenuItem.componentsSeparatedByString("/") as NSArray
            //println(separatedItems)
            //Add elements (sub menu which are located at index 2) to ingredients
            ingredients.addObject(separatedItems.objectAtIndex(2))
        }
        return ingredients
    }
    
    //Function that grabs price and adds them to prices array
    func grabprices(thisMenu:String) -> NSMutableArray{
        
        let thisMenuContents: NSString = try! String(contentsOfFile: thisMenu, encoding: NSUTF8StringEncoding)
        let allElements = thisMenuContents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as NSArray
        
        //Array to capture initial menu items and their information
        let menuItemsInfo:NSMutableArray = []
        
        //Create menuItemsInfo Array that will hold all menu items main information separately
        for var index=0; index<allElements.count; ++index{
            //Check if object is empty
            //If element is empty
            if (allElements.objectAtIndex(index) as! String == ""){
                //Don't add element to menuItemsInfo Array
            }
                
            else{
                //Add element to menuItemsInfo Array
                menuItemsInfo.addObject(allElements.objectAtIndex(index))
            }
        }
        
        //Array to hold prices
        let prices:NSMutableArray = []
        
        //Iterate through each element of menuItemsInfo array, set that element as it's own menu item (thisMenuItem), and then finally add the prices to the prices array
        for var index=0; index<menuItemsInfo.count; ++index{
            //create var for element at index in menuItemsInfo
            thisMenuItem = menuItemsInfo.objectAtIndex(index) as! NSString
            //Array to hold all the information seprated into their own items
            let separatedItems = thisMenuItem.componentsSeparatedByString("/") as NSArray
            //Add elements (sub menu which are located at index 2) to ingredients
            prices.addObject(separatedItems.objectAtIndex(3))
        }
        return prices
    }
}


//
//  EditYourProfileViewController.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-06.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class EditYourProfileViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    /*
Below are variables that will mainly be used to deal with TableViews
*/
    
    @IBOutlet var ingredientsTableView: UITableView!
    
    @IBOutlet var myIngredientsTableView: UITableView!
    
    var ingredientsTableViewData: NSMutableArray = ["Anchovies","Flounder", "Herring", "Scrod", "Trout", "Pollack", "Grouper", "Mahi Mahi", "Swordfish", "Tuna", "Bass", "Haddock", "Perch", "Sole", "Catfish", "Hake", "Pike", "Snapper", "Cod", "Halibut", "Salmon", "Talapia", "Abalone", "Cuttlefish", "Mussels", "Squid", "Clams", "Krill", "Octopus", "Whelks", "Crabs", "Limpet", "Oysters", "Cockles", "Langoustine", "Periwinkle", "Crawfish", "Lobster", "Prawns", "Albumin", "Meringue", "Eggs", "Ovalbumin", "Eggnog", "Surimi", "Lysozyme", "Mayonnaise", "Butter", "Cottage Cheese", "Half & Half", "Sour Cream", "Buttermilk", "Curds", "Ice Cream", "Sour Milk", "Casein", "Custard", "Lactaclbumin", "Tagtose", "Cheese", "Diacetyl", "Milk", "Whey", "Cream", "Ghee", "Pudding", "Yogurt", "Almonds", "Brazil", "Chinese Almond", "Coconut", "English Walnut", "Hickory", "Juniper Berry", "Mamoncillo", "Nut Butters", "Ogbono", "Persian Walnuts", "Polynesian Chestnut", "Sapucaya", "Walnut", "Artificial Nuts", "Butternut", "Chestnut", "Colocynth", "Gianduja", "Indian Beech", "Kluwak", "Mongongo", "Nut Extracts", "Para", "Pesto", "Sapucia", "Walter Caltrop", "Australian", "Candlenut", "Chinquapin", "Cream", "Gingko", "Indian","Kola", "Marzipan", "Nut Milks", "Paradise", "Pine", "Praline", "Shea", "White", "Black Walnut", "Cashews", "Chufa", "Cucrbita Ficifolia", "Hazlenut/Fiberts", "Japanese Almond", "Lychee", "Maya", "Nut Oils", "Peanuts", "Pinyon", "Queensland", "Terminalia Catappa", "White Walnut", "Beechnut", "Chinese Almond", "Cobnut", "Earth", "Heartnut", "Jesuit", "Macadamia", "Nangai", "Oak Acorns", "Pecan", "Pistachio", "Rush", "Tiger", "Barley", "Club Wheat", "Emmer", "Karmut", "Seitan", "Starch", "Wheat Germ", "Bran", "Couscous", "Farina", "Malt", "Semolina", "Triticale", "Wheat Grass", "Bread Crumbs", "Cracker Meal", "Flour", "Matzoh", "Soy Sauce", "Vital Wheat Gluten", "Wheat Protein", "Bulgur", "Durum", "Hydrolyzed Wheat Protein", "Oats", "Spelt", "Wheat", "Cereal Extract", "Einkorn", "Pasta", "Sprouted Wheat", "Wheat Berries", "Acai", "Bananas", "Bread Fruit", "Cucumbers", "Elderberries", "Guava", "Jujubes", "Lychees", "Nectarines", "Passion Fruit", "Pineapple", "Quince", "Sapadilla", "Tomatoes", "Yellow Watermelon", "Apples", "Bilberries", "Cantaloupes", "Currants", "Figs", "Honey Dew Melons", "Kiwis", "Mangos", "Ogden Melons", "Peaches", "Plums", "Rambuton", "Strawberries", "Ugli Fruit", "Apricots", "Blueberries", "Cherimoya", "Dates", "Gooseberries", "Horned Melon", "Kumquat", "Mangosteen", "Olives", "Pears", "Pluot", "Raspberries", "Tamarind", "Voavanga", "Zucchini", "Avocado", "Blackberries", "Cherries", "Durian", "Grapes", "Huckleberries", "Lemons", "Mulberries", "Oranges", "Peppers", "Pomegranate", "Rose Apple", "Tangelo", "Watermelons", "Ackee", "Boysenberries", "Cranberries", "Eggplant", "Grapefruit", "Ita Palm", "Limes", "Muskmelon", "Papaya", "Persimmon", "Pickly Pear", "Starfruit", "Tangerines", "Xigua Melon", "Bay Leaves", "Cloves", "Nutmeg", "Black Peppercorns", "Cream of Tartar", "Oregano", "Thyme", "Cayenne", "Cumin", "Paprika", "Vanilla Extract", "Chili", "Curry", "Red Pepper Flakes", "Cinnamon", "Ginger", "Rosemary", "Chia", "Sesame", "Flaxseed", "Safflower", "Hemp", "Sunflower", "Poppy", "Pumpkin", "Accorn Squash", "Artichoke", "Bean Sprouts", "Broccoli", "Caraway", "Celery", "Cilantro", "Dill", "Endive", "Horseradish", "Jerusalem Artichokes", "Kelp", "Lettuce", "Miner's Lettuce", "Nettles", "Palm Heart", "Pumpkin", "Rhubarb", "Shiso", "Tomatillo", "Watercress", "Alfalfa Sprouts", "Arugula", "Beets", "Broccolini", "Carrot", "Chayote", "Coriander", "Dinosaur Kale", "Escarole", "Escarole", "Hubbarb Squash", "Kohlrabi", "Lime", "Mizuna", "Nori", "Parsley", "Radicchio", "Rosemary", "Spaghetti Squash", "Turnip", "Yam", "Amaranth", "Asparagus", "Belgian Endive", "Cassava", "Cucumbers", "Collard Greens", "Dulse", "Fennel", "Jalapeno", "Jicama", "Leeks", "Lotus Root", "Mushrooms", "Okra", "Parsnips", "Radish", "Rutabaga", "Spinach", "Wakame", "Zucchini", "Anise", "Bamboo Shoots", "Bell Peppers", "Butternut Squash", "Cauliflower", "Chicory", "Corn", "Daikon", "Fiddleheads", "Japanese Eggplant", "Kai-lan", "Lemon", "Mache", "Napa Cabbage", "Onions", "Pattypan Squash", "Rapeseed", "Salsify", "Taro", "Wasabi", "Arrowroot", "Basil", "Bok Choy", "Cabbage", "Celeriac", "Chives", "Dandelion", "Edamame", "Garlic", "Kale", "Lemongrass", "Marjoram", "Nasturtium", "Olives", "Patatoes", "Rapini", "Shallots", "Thyme", "Water Chestnut", "Black Beans", "Green Beans", "Peas", "Bean Sprout", "Kidney Beans", "White Beans", "Chickpeas", "Lentils", "Yellow Beans", "Cannellini Beans", "Mung Beans", "Cranberry Beans", "Navy Beans", "Beef", "Buffalo", "Chicken Liver", "Foie Gras", "Goose Liver", "Lamb", "Organ Meats", "Quail", "Squirrel", "Venison", "Beef Heart", "Bison", "Chicken Stock", "Gelatin", "Guinea Hen", "Marrow", "Ostrich", "Rabbit", "Sweetbreads", "Beef Liver", "Calf's Liver", "Duck", "Gizzards", "Ham", "Moose", "Partridge", "Rennet", "Tripe", "Beef Tongue", "Caribou", "Duck Liver", "Goat", "Horse", "Mutton", "Pheasant", "Snake", "Turtle", "Beef Stock", "Chicken", "Emu", "Goose", "Kangaroo", "Opossum", "Pork", "Squab", "Veal"]
    
    var myIngredientsTableViewData:NSMutableArray = []
    
    //String to determine current text of row in ingredientsTableView
    var ingredientsTableViewString: String = ""
    
    /*
Below are variables that will be used to deal with the SearchBar
*/
    @IBOutlet var ingredientsSearchBar: UISearchBar!
    
    var searchActive:Bool = false
    
    //Array to hold filtered results
    var filteredIngredients = []
    
    
    @IBOutlet var backgroundTapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Change nav bar colour
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.78039216, green: 0.81960784, blue: 0.84705882, alpha: 1)
        
        //Register cell class for myIngredientsTableView
        self.myIngredientsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        ingredientsSearchBar.delegate = self
    }
    
    //Search bar methods:
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = false
        
        //Set filteredIngredients array equal to the full ingredientsTableViewData array (prevents crash)
        if (filteredIngredients == ""){
            filteredIngredients = ingredientsTableViewData
            self.ingredientsTableView.reloadData()
        }
        
    }
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        searchActive = true
        //If the searchText is not empty, refine the search but if it is empty don't do anything
        if (searchText != ""){
            let resultsPredicate = NSPredicate(format: "self contains[c] %@", searchText)
            filteredIngredients = self.ingredientsTableViewData.filteredArrayUsingPredicate(resultsPredicate)
        }
        else {
            filteredIngredients = ingredientsTableViewData
        }
        
        self.ingredientsTableView.reloadData()
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
        if (tableView == ingredientsTableView){
            if (searchActive){
                return filteredIngredients.count
            }
            else{
        return self.ingredientsTableViewData.count
            }
        }
        else{
            return myIngredientsTableViewData.count
        }
    }
    
    //Delegates
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (tableView == myIngredientsTableView){
        let cell:UITableViewCell = self.myIngredientsTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        //Set label of cells
        cell.textLabel!.text = myIngredientsTableViewData[indexPath.row] as? String
        
        return cell
        }
            
        else if (tableView == ingredientsTableView){
            let cell:IngredientsTableViewCell = self.ingredientsTableView.dequeueReusableCellWithIdentifier("ingredientsCell", forIndexPath: indexPath) as! IngredientsTableViewCell
            
            if (searchActive){
                cell.ingredientsLabel.text = filteredIngredients[indexPath.row] as? String
                return cell
            }
            else {
            cell.ingredientsLabel.text = ingredientsTableViewData[indexPath.row] as? String
                return cell
            }
            
        }
        else{
            return UITableViewCell()
        }
    }
    
    //Enable TableView editing
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if (tableView == myIngredientsTableView){
        return true
        }
        else{
            return false
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //Remove item
        self.myIngredientsTableViewData.removeObjectAtIndex(indexPath.row)
        
        //Reload TableView
        self.myIngredientsTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Close ingredientsSearchBar keyboard
        ingredientsSearchBar.resignFirstResponder()
        
        if (filteredIngredients.count == 0){
            ingredientsTableViewString = ingredientsTableViewData.objectAtIndex(indexPath.row) as! String
        }
        else{
            ingredientsTableViewString = filteredIngredients.objectAtIndex(indexPath.row) as! String
        }
        
    }
    
    @IBAction func addButtonClicked(sender: AnyObject) {
        
        //Close ingredientsSearchBar keyboard
        ingredientsSearchBar.resignFirstResponder()
        
        //Add current ingredientsTableView selection row text to myIngredientsTableViewData array
        //First check if myIngredientsTableViewData array is empty and if so, add object in
        if (myIngredientsTableViewData.count == 0){
            myIngredientsTableViewData.addObject(ingredientsTableViewString)
        }
        
        //Then check whether the object already exists in the myIngredientsTableViewData array
        //Create check variable, if object exists we will will not
        var check = 0
        for var int=0; int<myIngredientsTableViewData.count; ++int{
            //If string exists, set check equal to 1
            if (ingredientsTableViewString == myIngredientsTableViewData.objectAtIndex(int) as! String) {
                check = 1
            }
            else{
            }
            
        }
        
        //If check comes out 0, add current PickerView row text to ingredientsTableViewData array
        if (check == 0){
            myIngredientsTableViewData.addObject(ingredientsTableViewString)
        }
        else{
        }
        
        //Reload myIngredientsTableView data
        self.myIngredientsTableView.reloadData()
    
    }
    @IBAction func backgroundTapped(sender: AnyObject) {
        //Close ingredientsSearchBar keyboard
        ingredientsSearchBar.resignFirstResponder()
        
        //Adding this feature will make it possible to still use the DidSelectRowAtIndexPath method on TableViews:
        backgroundTapGesture.cancelsTouchesInView = false
    }

}

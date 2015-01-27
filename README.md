# Tabbed-and-TableView-Application
Use array of tuples
-------------------
* **Define and create**

        typealias ToDoList = (title:String, details:String)
        
        var listArray:[ToDoList] = [("Buy water","Furified"),
            ("Buy bread", "French"),
            ("Go to Gym", "Gold's GYM")]
          
* **Access tuple element**

        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var currentCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
            let (title, details) = listArray[indexPath.row]
            currentCell.textLabel?.text = title
            currentCell.detailTextLabel?.text = details
            
            return currentCell
        }

Use array of dictionaries
-------------------------
* **Define and create**

        var listArray:[Dictionary<String, String>] = []
        ...
        var currentTask:Dictionary<String, String> = ["title":"", "details":""]
        ...
        let newItem:Dictionary<String,String> = ["title":newTitle, "details":newDetails]
        listArray.append(newItem)
        
* **Access dictionary element**

        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var currentCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
            let currentItem = listArray[indexPath.row]
            currentCell.textLabel?.text = currentItem["title"]
            currentCell.detailTextLabel?.text = currentItem["details"]
            
            return currentCell
        }

Simple method to permanently store data
---------------------------------------
* **Step 1. Data creation or update by calling *"NSUserDefaults.standardUserDefaults().setObject"*.**

  Variables need to be changed to constant first in order to be saved later
  
* **Step 2. Data save by calling *"NSUserDefaults.standardUserDefaults().synchronize()"*.**

        // Permanently save data: only can be used for fixed length data structure
        // - keep overwriting if the key is the same
        let fixedArray = listArray
        NSUserDefaults.standardUserDefaults().setObject(fixedArray, forKey: "listArray")
        NSUserDefaults.standardUserDefaults().synchronize()
        
* **Step 3. Data access by calling *"NSUserDefaults.standardUserDefaults().objectForKey"*.**

        override func viewWillAppear(animated: Bool) {
            // Load data from save
            if var storedData:AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("listArray") {
                listArray.removeAll(keepCapacity: false)
                for var i=0; i<storedData.count; i++ {
                    listArray.append(storedData[i] as Dictionary)
                }
            }
        }


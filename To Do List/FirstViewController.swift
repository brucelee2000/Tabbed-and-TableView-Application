//
//  FirstViewController.swift
//  To Do List
//
//  Created by Yosemite on 1/11/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

var listArray:[Dictionary<String, String>] = []

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var currentCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        let currentItem = listArray[indexPath.row]
        currentCell.textLabel?.text = currentItem["title"]
        currentCell.detailTextLabel?.text = currentItem["details"]
        
        return currentCell
    }
    
    // Edit table
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            listArray.removeAtIndex(indexPath.row)
            // Save data after data is changed
            let fixedArray = listArray
            NSUserDefaults.standardUserDefaults().setObject(fixedArray, forKey: "listArray")
            NSUserDefaults.standardUserDefaults().synchronize()
            // Refresh data in view in realtime
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as DetailViewController
        let indexPath = self.tableView.indexPathForSelectedRow()
        let currentTask = listArray[indexPath!.row]
        detailVC.currentTask = currentTask
    }
    
    override func viewWillAppear(animated: Bool) {
        // Load data from save
        if var storedData:AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("listArray") {
            listArray.removeAll(keepCapacity: false)
            for var i=0; i<storedData.count; i++ {
                listArray.append(storedData[i] as Dictionary)
            }
        }
    }
    
}


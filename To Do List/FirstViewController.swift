//
//  FirstViewController.swift
//  To Do List
//
//  Created by Yosemite on 1/11/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit


typealias ToDoList = (title:String, details:String)

var listArray:[ToDoList] = [("Buy water","Furified"),
    ("Buy bread", "French"),
    ("Go to Gym", "Gold's GYM")]

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
        let (title, details) = listArray[indexPath.row]
        currentCell.textLabel?.text = title
        currentCell.detailTextLabel?.text = details
        
        return currentCell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as DetailViewController
        let indexPath = self.tableView.indexPathForSelectedRow()
        let currentTask = listArray[indexPath!.row]
        detailVC.currentTask = currentTask
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
}


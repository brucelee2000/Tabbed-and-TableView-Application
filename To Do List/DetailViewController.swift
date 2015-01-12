//
//  DetailViewController.swift
//  To Do List
//
//  Created by Yosemite on 1/11/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var currentTask:ToDoList?
    
    @IBOutlet weak var taskTitle: UILabel!
    
    @IBOutlet weak var taskDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    override func viewWillAppear(animated: Bool) {
        if let (title, details) = currentTask {
            self.taskTitle.text = title
            self.taskDetails.text = details
        }
    }

}

//
//  SecondViewController.swift
//  To Do List
//
//  Created by Yosemite on 1/11/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var detailsTextField: UITextField!
    
    @IBAction func addButtonPressed(sender: UIButton) {
        let newTitle = titleTextField.text
        let newDetails = detailsTextField.text
        listArray.append((title:newTitle, details:newDetails))
              
        if titleTextField.isFirstResponder() {
            titleTextField.resignFirstResponder()
        } else if detailsTextField.isFirstResponder() {
            detailsTextField.resignFirstResponder()
        }
        
        titleTextField.text = ""
        detailsTextField.text = ""
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        titleTextField.text = ""
        detailsTextField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}


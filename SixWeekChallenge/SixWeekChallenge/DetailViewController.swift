//
//  DetailViewController.swift
//  SixWeekChallenge
//
//  Created by Adam Aldous on 3/11/16.
//  Copyright © 2016 Adam Aldous. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let person = self.person {
            
            person.name = self.nameTextField.text!
            
        } else {
            let newPerson = Person(name: nameTextField.text!)
            PersonController.sharedController.addPerson(newPerson)
            self.person = newPerson
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func updateWithEntry(person: Person) {
        
        self.person = person
        self.nameTextField.text = person.name
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

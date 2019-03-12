//
//  AddCounterViewController.swift
//  NotesApp3
//
//  Created by ivan piskun on 3/12/19.
//  Copyright © 2019 ivan piskun. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddCounterViewController: UIViewController, UITextFieldDelegate {

// MARK: Properties
    
    @IBOutlet weak var nameText: UITextField! {
        didSet {
            nameText.textFieldPreferences()
        }
    }
    
    @IBOutlet weak var descText: UITextField! {
        didSet {
            descText.textFieldPreferences()
        }
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    //@IBOutlet weak var countLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // set up delegates
        nameText.delegate = self
        descText.delegate = self
        
        
        saveButton.isEnabled = false
        nameText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange (_ textField:UITextField) {
        if let name = nameText.text {
            if !name.isEmpty {
                saveButton.isEnabled = true
            } else {
                saveButton.isEnabled = false
            }
            
        }
}
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let counterItem = Counters(context: context)
    
    
    counterItem.name = nameText.text
    
    if let desc = descText.text {
        counterItem.desc = desc
    }
    
    appDelegate.saveContext()
    self.dismiss(animated: true, completion: nil)
}


// MARK: Text Field Stuff
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}

}

extension UITextField {
    func textFieldPreferences() {
        self.layer.masksToBounds = true
        
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        
        // padding
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 15.0))
        self.rightView = leftView
        self.leftView = leftView
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        
    }
}

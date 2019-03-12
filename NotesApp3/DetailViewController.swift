//
//  DetailViewController.swift
//  NotesApp3
//
//  Created by ivan piskun on 3/12/19.
//  Copyright © 2019 ivan piskun. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var receivedName: String?
    
    
    @IBOutlet weak var descLabel: UILabel!
    var receivedDesc: String?
    var receivedIndex: Int?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        if let finalName = receivedName {
            nameLabel.text = String(finalName)
        }
        if let finalDesc = receivedDesc {
            descLabel.text = String(finalDesc)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCount() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Counters")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
               let data = result[receivedIndex!]
            
            
            appDelegate.saveContext()
        } catch {
            print("error")
        }
        
    }
    
}


//
//  ViewController.swift
//  NotesApp3
//
//  Created by ivan piskun on 3/12/19.
//  Copyright © 2019 ivan piskun. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    // MARK: Properties
    var counters : [Counters] = []
    
    //MARK: Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: My Methods
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData() 
    }
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            counters = try context.fetch(Counters.fetchRequest())
        } catch {
            print("Fetching failed")
        }
    }
    
    // MARK: My Methods - Set Up Cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "counterCell", for: indexPath) as? CounterTableViewCell else {
            fatalError("No.")
        }
        
        let counter = counters[indexPath.row]
        cell.nameLabel.text = counter.name!
        if let desc = counter.desc {
            cell.descLabel.text = desc
        } else {
            cell.descLabel.text = ""
        }
        
        return cell
        
    }
    
    // MARK: My Methods - Edit Cells
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            // delete
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let commit = counters[indexPath.row]
            
            appDelegate.persistentContainer.viewContext.delete(commit)
            
            counters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            appDelegate.saveContext()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            let counter = counters[indexPath.row]
            
            vc.receivedName = counter.name
            vc.receivedIndex = indexPath.row
            
            if let desc = counter.desc {
                vc.receivedDesc = desc
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}



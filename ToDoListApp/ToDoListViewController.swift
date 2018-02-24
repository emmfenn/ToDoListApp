//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Michael Fenech on 24/2/18.
//  Copyright © 2018 michael fenech. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["Send emails", "Answer emails", "Make calls", "Look at new deals", "Call Brad", "Read book"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: tableview data source methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    //MARK: tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
//    func alert () {
//
//        let alertController = UIAlertController(title: "Password Entry", message: "", preferredStyle: .alert)
//
//        // Add a textField to your controller, with a placeholder value & secure entry enabled
//        alertController.addTextField { textField in
//            textField.placeholder = "Enter password"
//            textField.isSecureTextEntry = false
//            textField.textAlignment = .center
//        }
//
//        // A cancel action
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
//            print("Canelled")
//        }
//
//        // This action handles your confirmation action
//        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
//            print("Current password value: \(alertController.textFields?.first?.text ?? "None")")
//        }
//
//        // Add the actions, the order here does not matter
//        alertController.addAction(cancelAction)
//        alertController.addAction(confirmAction)
//
//        // Present to user
//        present(alertController, animated: true, completion: nil)
//
//    }
    
    

}


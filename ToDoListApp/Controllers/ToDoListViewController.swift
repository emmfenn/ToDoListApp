//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Michael Fenech on 24/2/18.
//  Copyright © 2018 michael fenech. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
//        if let toDo = defaults.array(forKey: "ToDoListArray") as? [Item] {
//
//            itemArray = toDo
//
//        }
        
    }
    
    //MARK: tableview data source methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
       
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    //MARK: tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
    
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: add new items
    
    @IBAction func addNewItems(_ sender: UIBarButtonItem) {
        
        alert()
        
    }
    
    //MARK: Alert function when adding new items
    
    func alert() {

        let alertController = UIAlertController(title: "Enter new item", message: "", preferredStyle: .alert)

        // Add a textField to your controller, with a placeholder value & secure entry enabled
        alertController.addTextField { textField in
            textField.placeholder = "Add new item here"
            textField.isSecureTextEntry = false
            textField.textAlignment = .left
        }

        // A cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancelled")
        }

        // This action handles your confirmation action
        let confirmAction = UIAlertAction(title: "Add item", style: .default) { _ in
            
            let item = alertController.textFields?.first?.text
            
            let addedItems = Item()
            
            addedItems.title = item!
            
            self.itemArray.append(addedItems)
            
            self.saveItems()
            
            print(self.itemArray)
           
            //print("Current password value: \(alertController.textFields?.first?.text ?? "None")")
        }

        // Add the actions, the order here does not matter
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)

        // Present to user
        present(alertController, animated: true, completion: nil)

    }
    
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        
        do {
            
            let data = try encoder.encode(itemArray)
            
            try data.write(to: dataFilePath!)
            
        } catch {
            
            print("Error encoding item array \(error)")
            
        }
        
        self.tableView.reloadData()
        
    }
    
    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            
            let decoder = PropertyListDecoder()
            
            do {
                
                itemArray = try decoder.decode([Item].self, from: data)
                
            } catch {
                
                print("Error in decoding item \(error)")
                
            }
            
        }
        
    }
 
}


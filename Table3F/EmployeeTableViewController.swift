//
//  EmployeeTableViewController.swift
//  Table3F
//
//  Created by Fausto Checa on 20/6/17.
//  Copyright © 2017 Fausto Checa. All rights reserved.
//

import UIKit

class EmployeeTableViewController: UITableViewController {
    
    
    var employees = ["Fausto", "Carlos", "Kike"]
    var DATA_KEY = "Employees"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

            }
    
    func loadData() {
        let obj = UserDefaults.standard.object(forKey: DATA_KEY)
        
        if let myArray = obj as? NSArray {
            employees = myArray as! [String]
            
        }
    
    }
    
    func saveData() {
         UserDefaults.standard.set(self.employees, forKey: DATA_KEY)
    
    
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
        
            employees.remove(at: indexPath.row)
            self.saveData()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
    }
    
    

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = employees[indexPath.row]
        return cell
    }
    
    @IBAction func add(_ sender: Any) {
        
        
        //lanzar un alert  para recoger un String que meter en el array
        let alert = UIAlertController(title: "Add", message: "Añadir empleado", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction: UIAlertAction) in
            if let textField = alert.textFields?[0] {
                
                let newEmployee = textField.text
                
                if newEmployee != "" {
                    self.employees.append(newEmployee!)
                    self.saveData()
                    self.tableView.reloadData()
                }
                
                
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

        
        
        
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
    
        
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        self.loadData()
        self.tableView.reloadData()
        
        
        
        
        // run the app with the current employee array
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditDataVC" {
            let destination = segue.destination as! EditDataVC
            
            destination.employees = self.employees
            destination.index = (tableView.indexPathForSelectedRow?.row)!
            
            
            
        }
    }

   
}

//
//  EditDataVC.swift
//  Table3F
//
//  Created by Fausto Checa on 22/6/17.
//  Copyright © 2017 Fausto Checa. All rights reserved.
//

import UIKit

class EditDataVC: UIViewController {
    
    var employees = [String]()
    var index = Int()
    
    
    @IBOutlet weak var editText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editText.text = employees[index]
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func startEiditing(_ sender: Any) {
        editText.isEnabled = true
    }
    
    
    @IBAction func doneEditing(_ sender: Any) {
        
        let newName = self.editText.text!
        self.employees[self.index] = newName
        UserDefaults.standard.set(self.employees, forKey: "Employees")
        self.navigationController?.popViewController(animated: true)

        
        }
    
    
}

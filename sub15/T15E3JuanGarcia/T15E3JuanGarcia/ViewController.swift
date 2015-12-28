//
//  ViewController.swift
//  T15E3JuanGarcia
//
//  Created by jgd on 28/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBAction func saveContact(sender: UIButton) {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext
        
        var celda = NSEntityDescription.insertNewObjectForEntityForName("Form", inManagedObjectContext: context)
        celda.setValue(nameTextField.text, forKey: "name")
        celda.setValue(surnameTextField.text, forKey: "surname")
        
        do {
            try context.save()
        } catch _{
            print("error")
        }
        
        loadTable()
        self.table.reloadData()
        nameTextField.text = ""
        surnameTextField.text = ""
    }
    
    func loadTable() {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext
        
        var request = NSFetchRequest(entityName: "Form")
        request.returnsObjectsAsFaults = false
        
        do {
            results = try context.executeFetchRequest(request)
            
        } catch _ {
            print("error")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contacts"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell! = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        var aux = results[indexPath.row] as! NSManagedObject
        cell.textLabel!.text = aux.valueForKey("name") as! String
        cell.detailTextLabel!.text = aux.valueForKey("surname") as! String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

}

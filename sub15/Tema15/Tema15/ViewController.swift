//
//  ViewController.swift
//  Tema15
//
//  Created by jgd on 27/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell! = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        var aux = results[indexPath.row] as! NSManagedObject
        cell.textLabel!.text = aux.valueForKey("title") as! String
        cell.detailTextLabel!.text = aux.valueForKey("subtitle") as! String
        cell.imageView!.image = UIImage(named: aux.valueForKey("image") as! String)
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tabla ejemplo core"
    }
}


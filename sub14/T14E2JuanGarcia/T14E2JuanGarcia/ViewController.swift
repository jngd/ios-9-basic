//
//  ViewController.swift
//  T14E2JuanGarcia
//
//  Created by jgd on 29/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

var cells: NSDictionary? = NSDictionary()

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let path = NSBundle.mainBundle().bundlePath
    let plistName = "Property List.plist"
    let finalPath = (path as NSString).stringByAppendingPathComponent(plistName)
    cells = NSDictionary(contentsOfFile: finalPath)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cells!.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
    
    let celda: AnyObject = cells!.objectForKey("cell\(indexPath.row)")!
    cell.textLabel?.text = celda.objectForKey("title") as! String
    cell.detailTextLabel?.text = celda.objectForKey("subtitle") as! String
    cell.imageView?.image = UIImage(named: celda.objectForKey("image") as! String)
    
    return cell
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Header"
  }
  
  func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String {
    return "Table footer"
  }
  
}

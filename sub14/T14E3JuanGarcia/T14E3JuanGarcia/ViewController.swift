//
//  ViewController.swift
//  T14E3JuanGarcia
//
//  Created by jgd on 29/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
    
    cell.mainLabel.text = "Main text"
    cell.secondLabel.text = "Secondary text"
    cell.imageView?.image = UIImage(named: "im1.jpeg")
    
    return cell
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Header"
  }
  
  func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String {
    return "Table footer"
  }
  
}

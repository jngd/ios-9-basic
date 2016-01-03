//
//  CustomCell.swift
//  T14E3JuanGarcia
//
//  Created by jgd on 29/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  @IBOutlet weak var mainLabel: UILabel!
  
  @IBOutlet weak var secondLabel: UILabel!
  
  @IBOutlet weak var imagen: UIImageView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

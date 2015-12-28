//
//  ViewController.swift
//  T11E3bJuanGarcia
//
//  Created by jgd on 26/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var items : NSArray = [UIImage(named:"im1.jpeg")!, UIImage(named:"im2.jpeg")!,UIImage(named:"im3.jpeg")!,UIImage(named:"im4.jpeg")!,UIImage(named:"im5.jpeg")!,UIImage(named:"im6.jpeg")!,UIImage(named:"im7.jpeg")!,UIImage(named:"im8.jpeg")!,UIImage(named:"im9.jpeg")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var identifier : String = "collectionCell"
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! UICollectionViewCell
        
        var imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = items.objectAtIndex(indexPath.row % 9) as! UIImage
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count * 5
    }
}


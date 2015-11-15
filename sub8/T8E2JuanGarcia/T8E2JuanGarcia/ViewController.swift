//
//  ViewController.swift
//  T8E2JuanGarcia
//
//  Created by jgd on 19/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    
    var lastScaleFactor:CGFloat = 1
    
    override func viewDidLoad() {
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: "handlePinch:")
        image.addGestureRecognizer(pinchGesture)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer){
        var factor = sender.scale
        
        // Increase/decrease zoom
        if (factor > 1) {
            sender.view?.transform = CGAffineTransformMakeScale(
            lastScaleFactor + (factor-1),
            lastScaleFactor + (factor-1));
        } else {
            sender.view?.transform = CGAffineTransformMakeScale(
            lastScaleFactor * factor,
            lastScaleFactor * factor);
        }
        
        
        if (sender.state == UIGestureRecognizerState.Ended){
            if (factor > 1) {
                lastScaleFactor += (factor-1);
            } else {
                lastScaleFactor *= factor;
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


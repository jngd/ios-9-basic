//
//  CustomView.swift
//  T7E3JuanGarcia
//
//  Created by jgd on 19/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit




@IBDesignable
class CustomView: UIView {

    var title: UILabel!
    @IBInspectable var lineWidth: CGFloat = 20
    @IBInspectable var colorBorde: UIColor = UIColor.clearColor()
    @IBInspectable var texto: String?
    
    
    override func layoutSubviews() {
        self.backgroundColor = UIColor(red: 20/255.0, green: 123/255.0, blue: 110/255.0, alpha: 1.0)
        self.title = UILabel(frame: CGRectMake(lineWidth, self.frame.height/2-10, self.frame.width-(lineWidth*2),20))
        self.title.text = self.texto
        self.title.textAlignment = NSTextAlignment.Center
        self.title.backgroundColor = UIColor.whiteColor()
        self.addSubview(self.title)
        
    }
    
    
    
    override func drawRect(rect: CGRect) {
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        let myFrame: CGRect = self.bounds
        CGContextSetLineWidth(context, self.lineWidth)
        CGRectInset(myFrame, 5, 5)
        colorBorde.set()
        UIRectFrame(myFrame)
    }
}

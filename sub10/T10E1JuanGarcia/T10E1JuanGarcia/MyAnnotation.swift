//
//  MyAnnotation.swift
//  T10E1JuanGarcia
//
//  Created by jgd on 25/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    
    func getTitle() -> String {
        return title!
    }
    
    func getSubtitle() -> String {
        return subtitle!
    }
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
   
}

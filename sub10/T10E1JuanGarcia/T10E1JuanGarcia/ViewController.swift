//
//  ViewController.swift
//  T10E1JuanGarcia
//
//  Created by jgd on 25/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit
import MapKit

// For debug pruposes
func pretty_function(file:String = __FILE__, function:String = __FUNCTION__, line:Int = __LINE__){
    print("file:\((file as NSString).lastPathComponent) function:\(function) line:\(line)")
}

class ViewController: UIViewController, MKMapViewDelegate {

    @IBAction func pressAdd(sender: AnyObject) {
        
        let annotation = MyAnnotation(coordinate: CLLocationCoordinate2DMake(self.map.centerCoordinate.latitude, self.map.centerCoordinate.longitude),
                                        title: "mi anotacion",
                                        subtitle: "mi subtitulo")
        
        self.map.addAnnotation(annotation)
        
    }
    
    @IBAction func pressTrash(sender: AnyObject) {
        map.removeAnnotations(map.annotations)
    }
    
    @IBAction func pressRefresh(sender: AnyObject) {
        
        self.lonLabel.text = "\(self.map.centerCoordinate.longitude)"
        self.latLabel.text = "\(self.map.centerCoordinate.latitude)"

    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView! {
        
        pretty_function()
        
        if (annotation is MKUserLocation) {
            //if annotation is not an MKPointAnnotation (eg. MKUserLocation),
            //return nil so map draws default view for it (eg. blue dot)...
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.image = UIImage(named:"tick")
            anView!.canShowCallout = true
        }
        else {
            //we are re-using a view, update its annotation reference...
            anView!.annotation = annotation
        }
        
        return anView
    }
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


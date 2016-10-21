//
//  EleventhViewController.swift
//  xTester
//
//  Created by Dad on 10/18/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation

import UIKit
import MapKit

class EleventhViewController: UIViewController {
    
    
    var mapView : MKMapView!
    
    
    override func loadView() {
        
        print ("MapViewController loadView method started"  )
        
        //create a map view
        mapView = MKMapView()
        
        view  = mapView
        
        let segmentedControl  = UISegmentedControl(items:["Standard","Hybrid", "Satellite"] )
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        // call a method when value changes
        //segmentedControl.addTarget(self, action: Selector(("mapTypeChanged:")), for: .valueChanged)
        // call a method when value changes
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(segControl:)), for: .valueChanged)
        

        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints =  false
        view.addSubview(segmentedControl)
        
        // let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant:8)
        //let leadingConstraint  = segmentedControl.leadingAnchor.constraintEqualToAnchor((view.leadingAnchor))
        //let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
    }  //e nd function
    

    
    
    
    func mapTypeChanged(segControl:UISegmentedControl) {
        
        switch segControl.selectedSegmentIndex {
            
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
            
        }
        
        
    } // end functon
    

    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
}  // end class


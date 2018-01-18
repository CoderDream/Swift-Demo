//
//  ViewController.swift
//  创建一个MKMapView地图
//
//  Created by WingChing_Yip on 2017/11/10.
//  Copyright © 2017年 ywc. All rights reserved.
//

import UIKit

import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MKMapView(frame: self.view.bounds)
        mapView.mapType = MKMapType.standard
        mapView.showsTraffic = true
        mapView.showsPointsOfInterest = true
        let coordinate2D = CLLocationCoordinate2D(latitude: 45.000000, longitude: 116.397105)
        let zoomLevel = 0.02
        let region = MKCoordinateRegionMake(coordinate2D, MKCoordinateSpanMake(zoomLevel, zoomLevel))
        mapView.setRegion(region, animated: true)
        self.view.addSubview(mapView)
        
    }
}


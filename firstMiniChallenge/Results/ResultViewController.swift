//
//  ResultViewController.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/13/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit
import MapKit

class ResultViewController: UIViewController {

    
    public var test : [(x: CLLocationDegrees ,y: CLLocationDegrees)] = []
    public var actualPosition = CLLocation(latitude: 40.8425211, longitude: 14.2426034)
    public var citySelected = "Results"
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var latitude = 0.0
    public var longitude = 0.0
    public var cityName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = citySelected
        
        mapView.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPrefetchingEnabled = false
        self.tabBarController?.tabBar.isHidden = true
        
        test.append((x: 40.835211, y: 14.2426034))
        test.append((x: 40.835456, y: 14.2501048))
        test.append((x: 40.8357648, y: 14.2461082))
        test.append((x: 40.839078, y: 14.2485123))
        
        centerMapOnLocation(location: actualPosition)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        
        mapView.centerCoordinate = location.coordinate
        showCircle(coordinate: location.coordinate, radius: 100)
        
        let span = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta, longitudeDelta: mapView.region.span.longitudeDelta)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        
        animatedZoom(zoomRegion: region, duration: 1.5)
    }
    
    func showCircle(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance) {
        
        let circle = MKCircle(center: coordinate, radius: radius)
        
        self.mapView.removeOverlays(self.mapView.overlays)
        self.mapView.add(circle, level: MKOverlayLevel.aboveRoads)
    }
    
    
}

extension ResultViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
        let span = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta*10, longitudeDelta: mapView.region.span.longitudeDelta*10)
        let region = MKCoordinateRegion(center: actualPosition.coordinate, span: span)
        
        animatedZoom(zoomRegion: region, duration: 1.5)
        
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let span = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta/10, longitudeDelta: mapView.region.span.longitudeDelta/10)
        let region = MKCoordinateRegion(center: actualPosition.coordinate, span: span)
        
        animatedZoom(zoomRegion: region, duration: 1.5)
    }
    
    func animatedZoom(zoomRegion:MKCoordinateRegion, duration:TimeInterval) {
        
        MKMapView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            
            var viewRegion = MKCoordinateRegionMakeWithDistance(zoomRegion.center, 220, 220)
            self.mapView.setRegion(viewRegion, animated: true)
            
        }, completion: nil)
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let circle = overlay
        
        let circleRender = MKCircleRenderer(overlay: circle)
        circleRender.strokeColor = UIColor.blue
        circleRender.fillColor = UIColor.blue
        circleRender.alpha = 0.3
        circleRender.lineWidth = 2.0
        
        return circleRender
    }
    
}

extension ResultViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "travelguideCell", for: indexPath)
        
        actualPosition = CLLocation(latitude: test[indexPath.row].x, longitude: test[indexPath.row].y)
        centerMapOnLocation(location: actualPosition)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

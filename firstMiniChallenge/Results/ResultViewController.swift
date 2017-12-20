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

    public var actualPosition = CLLocation(latitude: 40.8425211, longitude: 14.2426034)
    public var placeSelected: Place?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var latitude = 0.0
    public var longitude = 0.0
    public var cityName = "Results"
    public var travelGuideIndexSelected = 0
    public var citySelected = "Rome"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPrefetchingEnabled = false
        
        self.tabBarController?.tabBar.isHidden = true
        
        if let found = Place.places.first(where: { $0.name == citySelected }) {
            placeSelected = found
            cityName = found.name
            actualPosition = CLLocation(latitude: found.travelGuides[0].latitude, longitude: found.travelGuides[0].longitude)
            
        }
        
        self.title = cityName
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            var destinationViewController = segue.destination as! ProfileViewController
            
            destinationViewController.travelGuide = (placeSelected?.travelGuides[travelGuideIndexSelected])!
        }
        
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
     //   return travelGuides.count
        return placeSelected!.travelGuides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "travelguideCell", for: indexPath) as! TravelGuideCell
        
        cell.travelGuideImageView.image = placeSelected!.travelGuides[indexPath.row].image
        cell.descriptionTextView.text = placeSelected!.travelGuides[indexPath.row].description
        cell.nameLabel.text = placeSelected!.travelGuides[indexPath.row].name
        cell.locationLabel.text = placeSelected!.travelGuides[indexPath.row].location
        
        actualPosition = CLLocation(latitude: placeSelected!.travelGuides[indexPath.row].latitude, longitude: placeSelected!.travelGuides[indexPath.row].longitude)
        
        centerMapOnLocation(location: actualPosition)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        travelGuideIndexSelected = indexPath.row
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


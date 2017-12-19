//
//  TravelGuide.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/18/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import MapKit
import Foundation

/*
public class TravelGuide {
    
    public var latitude = 0.0
    public var longitude = 0.0
    public var name = ""
    public var description = ""
    
    init(latitude: CLLocationDegrees,longitude: CLLocationDegrees, name: String, description: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.description = description
    }
}*/

struct TravelGuide{
    
     var latitude : CLLocationDegrees
     var longitude : CLLocationDegrees
     var name : String
     var description : String
     var location: String
     var image: UIImage
    
    
    static var travelGuidesParis =
        [
            TravelGuide(latitude: 48.873612, longitude: 2.2938209, name: "Janet Ghelanis", description: "Descripcion",location: "Location 1", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 48.867065, longitude: 2.3167373, name: "Nombre Apellido", description: "Descripcion",location: "loaction 2", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 48.853764, longitude: 2.3099013, name: "Nombre Apellido", description: "Descripcion",location: "location 3", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 48.8600687, longitude: 2.3727792, name: "Nombre Apellido", description: "Descripcion",location: "location 4", image: UIImage(named: "Janet")!)
            
    ]
    
    
    static var travelGuides =
        [
            TravelGuide(latitude: 40.835211, longitude: 14.2426034, name: "Janet Ghelanis", description: "Descripcion",location: "Location 1", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 40.835456, longitude: 14.2501048, name: "Nombre Apellido", description: "Descripcion",location: "loaction 2", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 40.8357648, longitude: 14.2461082, name: "Nombre Apellido", description: "Descripcion",location: "location 3", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 40.839078, longitude: 14.2485123, name: "Nombre Apellido", description: "Descripcion",location: "location 4", image: UIImage(named: "Janet")!)
            
        ]
    
}

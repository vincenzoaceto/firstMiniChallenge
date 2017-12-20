//
//  TravelGuide.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/18/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import MapKit
import Foundation

struct TravelGuide{
    
     var latitude : CLLocationDegrees
     var longitude : CLLocationDegrees
     var name : String
     var description : String
     var location: String
     var image: UIImage
    
    
    static var travelGuidesParis =
        [
            TravelGuide(latitude: 48.873612, longitude: 2.2938209, name: "Janet Ghelanis", description: "Description",location: "Location 1", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 48.867065, longitude: 2.3167373, name: "Nombre Apellido", description: "Descripcion",location: "loaction 2", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 48.853764, longitude: 2.3099013, name: "Nombre Apellido", description: "Descripcion",location: "location 3", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 48.8600687, longitude: 2.3727792, name: "Nombre Apellido", description: "Descripcion",location: "location 4", image: UIImage(named: "Janet")!)
            
    ]
    
    
    static var travelGuides =
        [
            TravelGuide(latitude: 40.835211, longitude: 14.2426034, name: "Janet Ghelanis", description: "I have 2 huge passions in life 1: is traveling arround the world and i do everything in my power to keep doing it. The other is learn new languages",location: "Interests: Location 1", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 40.835456, longitude: 14.2501048, name: "Nombre Apellido", description: "Hello there I would love to be your guide!. Im a student and a singer. I can give you any kind of tour you are trying to put together",location: "Interests: Art, history, music, Folklore, food in Rome", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 40.8357648, longitude: 14.2461082, name: "Nombre Apellido", description: "I'm a student and I like to travel and take photos, also meet new people",location: "Interests: Local tour, guidance, accomodation", image: UIImage(named: "Janet")!),
            TravelGuide(latitude: 40.839078, longitude: 14.2485123, name: "Nombre Apellido", description: "I'm a professional turistic guide, I;m very passionate about archeology, movies, tv series and writing.",location: "Interests: Private tour, local experience, traditional food", image: UIImage(named: "Janet")!)
            
        ]
    
}

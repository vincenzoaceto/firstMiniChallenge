//
//  Place.swift
//  firstMiniChallenge
//
//  Created by Daniel Moreano on 12/18/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation
import MapKit

struct Place {
    public var latitude : CLLocationDegrees
    public var longitude: CLLocationDegrees
    public var name: String
    public var travelGuides : [TravelGuide]
    public var image: UIImage!
    
    static var places =
        [
            Place(latitude: 27.1761571, longitude: 77.9099732, name: "Agra", travelGuides: TravelGuide.travelGuidesAgra,image: UIImage(named: "brandenburger")),
            Place(latitude: 41.909986, longitude: 12.3959158, name: "Rome", travelGuides: TravelGuide.travelGuidesRome,image: UIImage(named: "Rome")),
            Place(latitude: 48.857835, longitude: 2.29231, name: "Paris", travelGuides: TravelGuide.travelGuidesParis,image: UIImage(named: "Paris"))
        ]
}

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
    var costPerDay: Int
    var passions: [String]
    var rating: Double
    
    static var travelGuidesParis =
        [
            TravelGuide(latitude: 48.86252, longitude: 2.30536, name: "Karen Venna", description: "Description",location: "Location 1", image: UIImage(named: "Janet")!,costPerDay: 10,passions: ["",""], rating: 1),
            TravelGuide(latitude: 48.88747, longitude: 2.32279, name: "Mattia Astete", description: "Descripcion",location: "loaction 2", image: UIImage(named: "Janet")!,costPerDay: 11,passions: ["",""], rating: 1),
            TravelGuide(latitude: 48.85552, longitude: 2.37773, name: "Dorita Figueroa", description: "Descripcion",location: "location 3", image: UIImage(named: "Janet")!,costPerDay: 12,passions: ["",""], rating: 1)
            
    ]
    
    
    static var travelGuidesRome =
        [
            TravelGuide(latitude: 41.902069, longitude: 12.4512413, name: "Janet Ghelanis", description: "I have 2 huge passions in life 1: is traveling arround the world and i do everything in my power to keep doing it. The other is learn new languages",location: "Interests: Books, Love rock Music,Fashionista, Pizza,", image: UIImage(named: "Guide1")!,costPerDay: 10,
                        passions: ["I love trying new cuisines","Books","Video Games", "Pizza","Smile","Studies","Family"], rating: 4),
            TravelGuide(latitude: 41.896087, longitude: 12.4710523, name: "Amanda Gutierrez", description: "Hello there I would love to be your guide!. Im a student and a singer. I can give you any kind of tour you are trying to put together",location: "Interests: Art, history, music, Folklore, food in Rome", image: UIImage(named: "Guide2")!,costPerDay: 11,
                        passions: ["Fashionista","Models", "Clothe", "Friends","Beer","Travel","Helping People","Series","Movies","Swimming"]
            , rating: 3),
            TravelGuide(latitude: 41.913675, longitude: 12.5137753, name: "Jose Xanders", description: "I'm a student and I like to travel and take photos, also meet new people",location: "Interests: Local tour, guidance, accomodation", image: UIImage(named: "Ross")!,costPerDay: 12,
                        passions: ["Global  Trotter","Drinking","Driving","Animals","Football","Computers","Singing","Painting","Eating"]
            , rating: 5),
            TravelGuide(latitude: 41.889422, longitude: 12.4665953, name: "Daria Zotova", description: "I'm a professional turistic guide, I;m very passionate about archeology, movies, tv series and writing.",location: "Interests: Private tour, local experience, traditional food", image: UIImage(named: "Maria")!,costPerDay: 13,
                        passions: ["Animals","Yoga","Studies","Meeting new people","Eating","Clothes","Cars","Music","Singing"]
            , rating: 4)
        ]
    
    static var travelGuidesAgra =
        [
            
            TravelGuide(latitude: 27.17953, longitude: 78.02111, name: "Janet Ghelanis", description: "Description Agra 1",location: "Interests: Books, Love rock Music,Fashionista, Pizza,", image: UIImage(named: "Guide1")!,costPerDay: 10,
                        passions: ["I love trying new cuisines","Books","Video Games", "Pizza","Smile","Studies","Family"], rating: 4),
            TravelGuide(latitude: 27.171596, longitude: 78.042120, name: "Janet Ghelanis", description: "Description Agra 2",location: "Interests: Books, Love rock Music,Fashionista, Pizza,", image: UIImage(named: "Guide1")!,costPerDay: 10,
                        passions: ["I love trying new cuisines","Books","Video Games", "Pizza","Smile","Studies","Family"], rating: 4),
            TravelGuide(latitude: 27.210191, longitude: 77.977783, name: "Janet Ghelanis", description: "Description Agra 3",location: "Interests: Books, Love rock Music,Fashionista, Pizza,", image: UIImage(named: "Guide1")!,costPerDay: 10,
                        passions: ["I love trying new cuisines","Books","Video Games", "Pizza","Smile","Studies","Family"], rating: 4),
            
    ]
    
    
}

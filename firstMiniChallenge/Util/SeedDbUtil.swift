////
////  SeedDbUtil.swift
////  firstMiniChallenge
////
////  Created by Bilal Abdullah on 18/12/2017.
////  Copyright © 2017 Vincenzo Aceto. All rights reserved.
////
//
//import Foundation
//
//class SeedDbUtil  {
//    public static func seedClient(){
//        var clients : [Client]  = []
//        
//        // Username, Password, Name, Surname, Age, email, facebook, city, country, profileImage
//        let sets: [(String, String, String?, String?, Int?, String, String, String?, String?, String?)] = [
//            ("eemeli", "rinne", "Eemeli", "Rinne", 34, "eemeli.rinne@example.com", "facebook.com/eemeli", "hammarland",
//             "Central Ostrobothnia", "Guide2"),
//            ("eemeli", "rinne", "Eemeli", "Rinne", 34, "eemeli.rinne@example.com", "facebook.com/eemeli", "hammarland",
//             "Central Ostrobothnia", "Guide2"),
//            ("eemeli", "rinne", "Eemeli", "Rinne", 34, "eemeli.rinne@example.com", "facebook.com/eemeli", "hammarland",
//             "Central Ostrobothnia", "Guide2"),
//            ("eemeli", "rinne", "Eemeli", "Rinne", 34, "eemeli.rinne@example.com", "facebook.com/eemeli", "hammarland",
//            "Central Ostrobothnia", "Guide2"),
//            ("eemeli", "rinne", "Eemeli", "Rinne", 34, "eemeli.rinne@example.com", "facebook.com/eemeli", "hammarland",
//             "Central Ostrobothnia", "Guide2")
//            ]
//        
//        for client in sets {
//            let (username, password, name, surname, age, email, facebook, city, country, profileImage) = client
//            var client = Client(username: username, password: password)
//            client.name = name
//            client.surname = surname
//            client.age = age
//            client.email = email
//            client.facebook = facebook
//            client.city = city
//            client.country = country
//            client.profileImage = profileImage
//            clients.append(client)
//        }
//        
//        do{
//            try ClientDAO.sharedInstance.persist(clients)
//        }catch _ {
//            
//        }
//        
//    }
//}


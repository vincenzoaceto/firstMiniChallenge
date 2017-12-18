//
//  ClientDAO.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 18/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation
import Firebase

class ClientDAO : DAO<Client> {
    static let sharedInstance = ClientDAO()
    var clients : [Client]
    
    override private init() {
        clients = []
        super.init()
    }
    
    override func persist(_ client: Client) throws {
        clients.append(client)
    }
    
    override func persist(_ clients: [Client]) throws {
        for client in clients {
            try self.persist(client)
        }
    }
    
    override func read(_ entityId: String) -> Client? {
        for client in clients {
            if client.entityId == entityId {
                return client
            }
        }
        return nil
    }
    
    override func readAll() -> [Client] {
        return clients
    }
}

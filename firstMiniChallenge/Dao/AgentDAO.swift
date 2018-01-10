////
////  AgentDAO.swift
////  firstMiniChallenge
////
////  Created by Bilal Abdullah on 18/12/2017.
////  Copyright © 2017 Vincenzo Aceto. All rights reserved.
////
//
//import Foundation
//
//class AgentDAO : DAO<Agent> {
//    static let sharedInstance = AgentDAO()
//    var agents : [Agent]
//    
//    override private init() {
//        agents = []
//        super.init()
//    }
//    
//    override func persist(_ agent: Agent) throws {
//        agents.append(agent)
//    }
//    
//    override func persist(_ agents: [Agent]) throws {
//        for agent in agents {
//            try self.persist(agent)
//        }
//    }
//    
//    override func read(_ entityId: String) -> Agent? {
//        for agent in agents {
//            if agent.entityId == entityId {
//                return agent
//            }
//        }
//        return nil
//    }
//    
//    override func readAll() -> [Agent] {
//        return agents
//    }
//}


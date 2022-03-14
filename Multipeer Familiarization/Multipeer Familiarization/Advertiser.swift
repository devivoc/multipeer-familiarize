//
//  Advertiser.swift
//  Multipeer Familiarization
//
//  Created by Christian DeVivo on 3/14/22.
//

import Foundation
import MultipeerConnectivity

struct Job: Codable, Identifiable {
    var id = UUID()
    let name: String
    
}

class Advertiser: NSObject, ObservableObject {
    private let myPeerId = MCPeerID(displayName: "Dewey")
    private let session: MCSession
    private let job: Job?
    
    init(_ job: Job? = nil){
        session = MCSession(
          peer: myPeerId,
          securityIdentity: nil,
          encryptionPreference:  MCEncryptionPreference.none)
        self.job = job
    }
    
    private var nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
        peer: MCPeerID(displayName: "Dewey"),
      discoveryInfo: nil,
      serviceType: "")
}

extension Advertiser: MCNearbyServiceAdvertiserDelegate
{
    
}

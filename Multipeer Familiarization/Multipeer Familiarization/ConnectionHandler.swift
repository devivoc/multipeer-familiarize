//
//  ConnectionHandler.swift
//  Multipeer Familiarization
//
//  Created by Christian DeVivo on 3/14/22.
//

import Foundation
import MultipeerConnectivity

class JobStore: ObservableObject {
  @Published var jobs: [Job] = []
}

struct Job: Codable, Identifiable {
    var id = UUID()
    let name: String
    
}

class ConnectionHandler: NSObject, ObservableObject {
    private let myPeerId = MCPeerID(displayName: "Dewey")
    private let session: MCSession
    private let job: Job?
    @Published var availableUsers: [MCPeerID] = []
    
    init(_ job: Job? = nil){
        session = MCSession(
          peer: myPeerId,
          securityIdentity: nil,
          encryptionPreference:  MCEncryptionPreference.none)
        self.job = job
        super.init()
        nearbyServiceAdvertiser.delegate = self
    }
    
    private var nearbyServiceBrowser = MCNearbyServiceBrowser(
      peer: MCPeerID(displayName: "Dewey"),
      serviceType: "Portfolio")
    
    private var nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
        peer: MCPeerID(displayName: "Dewey"),
      discoveryInfo: nil,
      serviceType: "Porfolio")
    
    func startBrowsing() {
      nearbyServiceBrowser.startBrowsingForPeers()
    }

    func stopBrowsing() {
      nearbyServiceBrowser.stopBrowsingForPeers()
    }
    
    var isAdvertising: Bool = false {
      didSet {
        if isAdvertising {
          nearbyServiceAdvertiser.startAdvertisingPeer()
          print("Started advertising")
        } else {
          nearbyServiceAdvertiser.stopAdvertisingPeer()
          print("Stopped advertising")
        }
      }
    }
}

extension ConnectionHandler: MCNearbyServiceAdvertiserDelegate
{
    //This function will be called when an invitation is received, which should never happen for our app
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {

    }
}

extension ConnectionHandler: MCNearbyServiceBrowserDelegate {
    //This function is called when a nearby user is found, so we add them to our list
  func browser(
    _ browser: MCNearbyServiceBrowser,
    foundPeer peerID: MCPeerID,
    withDiscoveryInfo info: [String: String]?
  ) {
    // 1
    if !availableUsers.contains(peerID) {
      availableUsers.append(peerID)
    }
  }
    //This function is called when a user is no longer available I think? not totally important yet
  func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
    guard let index = availableUsers.firstIndex(of: peerID) else { return }
    // 2
    availableUsers.remove(at: index)
  }
}

//
//  MainView.swift
//  Multipeer Familiarization
//
//  Created by Christian DeVivo on 3/14/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var ad: Advertiser
    @ObservedObject var jobStore: JobStore
    @State private var isAdvartising = false
    
    var headerView: some View {
      Toggle("Receive Jobs", isOn: $ad.isReceivingJobs)
    }
    
    init(jobStore: JobStore = JobStore()) {
      self.jobStore = jobStore
    }
    
}

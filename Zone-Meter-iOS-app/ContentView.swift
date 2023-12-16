//
//  ContentView.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Single zone readout", destination: HomeView())
                NavigationLink("Two zones readout", destination: ZoneSystem2())
                NavigationLink("Help & Documentation", destination: HelpView())
            }.listStyle(.sidebar)
                .navigationTitle("Zone Meter Tool")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

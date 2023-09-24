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
                NavigationLink("Single", destination: HomeView())
                NavigationLink("multi", destination: ZoneSystem2())
                NavigationLink("help", destination: HelpView())
            }.listStyle(.sidebar)
                .navigationTitle("Meter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            HomeView()
                .tabItem {
                    Image(systemName: "camera.metering.matrix");Text("Single Exposure")
                }.tag(1)
            ZoneSystem2()
                .tabItem {
                    Image(systemName: "camera.metering.multispot");Text("Multi Exposure")
                }.tag(2)
            HelpView()
                .tabItem {
                    Image(systemName: "questionmark.circle");Text("Help")
                }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

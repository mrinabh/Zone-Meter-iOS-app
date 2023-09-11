//
//  HomeView.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/8/23.
//

import SwiftUI

struct HomeView: View {
    
    var shutter_speeds = ["1", "1/2", "1/4", "1/8", "1/15", "1/30",
                          "1/60", "1/125", "1/250", "1/500", "1/1000",
                          "1/2000", "1/4000"]
    var zones = ["0", "I", "II", "III", "IV", "V",
                 "VI", "VII", "VIII", "IX", "X"]
    
    @State private var shutter_speed  = 6
    @State private var zone = 4
    
    var body: some View {
        GroupBox(
            label: Label("Zone System", systemImage: "camera.metering.matrix")
            .foregroundColor(.gray)
        ) {
            GroupBox {
                VStack {
                    HStack {
                        // Exposure selection
                        Text("Exposure").frame(minWidth: 200, alignment: .leading)
                        Picker("Shutter Speed", selection: $shutter_speed) {
                            ForEach(shutter_speeds.indices, id: \.self) { index in
                                Text(shutter_speeds[index])
                            }
                        }
                    }
                    .frame(minWidth: 300, alignment: .leading)
                    
                    HStack {
                        // Zone selection
                        Text("Zone").frame(minWidth: 200, alignment: .leading)
                        Picker("Zone Selection", selection: $zone) {
                            ForEach(zones.indices, id: \.self) { index in
                                Text(zones[index])
                            }
                        }
                    }
                    .frame(minWidth: 300, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            GroupBox {
                HStack {
                    // zones
                    VStack {
                        ForEach(zones.indices, id: \.self) { zindex in
                            HStack {
                                VStack {
                                    Text(zones[zindex])
                                }.frame(maxWidth: 25)
                                
                                VStack {
                                    // Zones
                                    let gray_val:Double = Double(zindex) / Double(zones.count)
                                    Rectangle()
                                        .fill(Color(white: gray_val))
                                        .frame(width: 40, height: 30)
                                }.frame(maxWidth: 90)
                                
                                VStack {
                                    // Shutter speeds
                                    let speed:Int = shutter_speed - zone + zindex
                                    if speed >= 0 && speed < shutter_speeds.count {
                                        if(zindex == 5) {
                                            Text(shutter_speeds[speed])
                                                .bold()
                                        } else if(speed == shutter_speed) {
                                            Text(shutter_speeds[speed])
                                                .foregroundColor(.blue)
                                        } else {
                                            Text(shutter_speeds[speed])
                                                .foregroundColor(.gray)
                                        }
                                        
                                    } else {
                                        if(speed < 0) {
                                            Text("--").foregroundColor(.blue)
                                        } else if (speed >= shutter_speeds.count ) {
                                            Text("--").foregroundColor(.red)
                                        }
                                    }
                                }.frame(maxWidth:200, alignment: .leading)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

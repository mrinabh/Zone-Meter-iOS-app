//
//  ContentView.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    var shutter_speeds = ["1", "1/2", "1/4", "1/8", "1/15", "1/30",
                          "1/60", "1/125", "1/250", "1/500", "1/1000",
                          "1/2000", "1/4000"]
    var zones = ["I", "II", "III", "IV", "V",
                 "VI", "VII", "VIII", "IX", "X"]
    
    @State private var shutter_speed  = 6
    @State private var zone = 4
    
    var body: some View {
        GroupBox(label: Text("Zone Meter").font(.title2)) {
            HStack {
                Text("Exposure Readout:")
                Picker("Shutter Speed", selection: $shutter_speed) {
                    ForEach(shutter_speeds.indices, id: \.self) { index in
                        Text(shutter_speeds[index])
                    }
                }
                Text("sec")
            }
            HStack {
                Text("Zone: ")
                Picker("Zone Selection", selection: $zone) {
                    ForEach(zones.indices, id: \.self) { index in
                        Text(zones[index])
                    }
                }
            }
            Divider()
            
            // Results from calculation
            GroupBox(label: Text("Readings").font(.caption)) {
                VStack {
                    ForEach(zones.indices, id: \.self) { zindex in
                        HStack {
                            LabeledContent("") {
                                Text(zones[zindex])
                                    .foregroundColor(.yellow)
                            }
                            let speed:Int = shutter_speed - zone + zindex
                            if speed >= 0 && speed < shutter_speeds.count {
                                Text(shutter_speeds[speed])
                            } else {
                                if(speed < 0) {
                                    Text("  ").border(.red)
                                } else if (speed >= shutter_speeds.count ) {
                                    Text("  ").border(.red)
                                }
                            }
                            
                        }
                        
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

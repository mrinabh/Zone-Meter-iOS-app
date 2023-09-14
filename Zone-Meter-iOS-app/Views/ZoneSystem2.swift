//
//  ZoneSystem2.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/10/23.
//

import SwiftUI

struct ZoneSystem2: View {
    let zones = Zones()
    var shutter_speeds = ["1", "1/2", "1/4", "1/8", "1/15", "1/30",
                          "1/60", "1/125", "1/250", "1/500", "1/1000",
                          "1/2000", "1/4000"]
//    var zones = ["0", "I", "II", "III", "IV", "V",
//                 "VI", "VII", "VIII", "IX", "X"]

    @State private var shutter_speed1  = 6
    @State private var shutter_speed2  = 10
    
    init() {
        self._shutter_speed1 = State(initialValue: 6)
        self._shutter_speed2 = State(initialValue: 10)
    }
    
    var body: some View {
        GroupBox(
            label: Label("Zone System", systemImage: "camera.metering.matrix")
            .foregroundColor(.gray)
        ) {
            GroupBox {
                VStack {
                    HStack {
                        // Exposure selection
                        Text("Exposure 1")
                            .frame(minWidth: 200, alignment: .leading)
                            .foregroundColor(.blue)
                        Picker("Shutter Speed", selection: $shutter_speed1) {
                            ForEach(shutter_speeds.indices, id: \.self) { index in
                                Text(shutter_speeds[index])
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxHeight: 70)
                    }
                    .frame(minWidth: 300, alignment: .leading)
                    Divider()
                    HStack {
                        // Exposure selection
                        Text("Exposure 2")
                            .frame(minWidth: 200, alignment: .leading)
                            .foregroundColor(.red)
                        Picker("Shutter Speed", selection: $shutter_speed2) {
                            ForEach(shutter_speeds.indices, id: \.self) { index in
                                Text(shutter_speeds[index])
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxHeight: 70)
                    }
                    .frame(minWidth: 300, alignment: .leading)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            GroupBox {
                HStack {
                    // zones
                    VStack {
                        ForEach(0..<zones.zones.count, id: \.self) { index in
                            let iZone: Zone = zones.zones[index]
                            HStack {
                                VStack {
                                    // Zones in Roman numeral
                                    Text(iZone.value)
                                }.frame(maxWidth: 25)
                                
                                VStack {
                                    GrayCard(zone: iZone)
                                }.frame(maxWidth: 90)
                                
                                // Find the arithmetic mean of exposure 1 & 2
                                let zone_five_exposure:Int = (shutter_speed1 + shutter_speed2)/2
                                let speed:Int = zone_five_exposure - 5 + index
                                
                                VStack {
                                    // Computed exposure values against zones
                                    if speed >= 0 && speed < shutter_speeds.count {
                                        if(index == 5) {
                                            Text(shutter_speeds[speed])
                                                .bold()
                                        } else if(speed == shutter_speed1) {
                                            Text(shutter_speeds[speed])
                                            .foregroundColor(.blue)
                                        } else if(speed == shutter_speed2) {
                                            Text(shutter_speeds[speed])
                                            .foregroundColor(.red)
                                        } else {
                                            Text(shutter_speeds[speed])
                                                .foregroundColor(.gray)
                                        }
                                    } else {
                                        if(speed < 1) {
                                            Text("--").foregroundColor(.blue)
                                        } else if (speed >= shutter_speeds.count ) {
                                            Text("--").foregroundColor(.red)
                                        }
                                    }
                                }.frame(maxWidth:200, alignment: .leading)
                                
                                // Display warning if under/over exposed
                                VStack {
                                    if((speed == shutter_speed1 || speed == shutter_speed2) && (index < 2 || index > 8)) {
                                        Label("", systemImage: "bolt.trianglebadge.exclamationmark")
                                            .foregroundColor(.purple)
                                    }
                                }
                                
                                // Show indicators when selected exp values are outside zone system bounds
                                VStack {
                                    if(shutter_speed1 < shutter_speed2) {
                                        if(speed > shutter_speed1 && index == 0) {
                                            Label(shutter_speeds[shutter_speed1], systemImage: "arrow.up")
                                                .foregroundColor(.purple)
                                        }
                                        if(speed < shutter_speed2 && index == 10) {
                                            Label(shutter_speeds[shutter_speed2], systemImage: "arrow.down")
                                                .foregroundColor(.purple)
                                        }
                                    } else {
                                        if(speed > shutter_speed2 && index == 0) {
                                            Label(shutter_speeds[shutter_speed2], systemImage: "arrow.up")
                                                .foregroundColor(.purple)
                                        }
                                        if(speed < shutter_speed1 && index == 10) {
                                            Label(shutter_speeds[shutter_speed1], systemImage: "arrow.down")
                                                .foregroundColor(.purple)
                                        }
                                    }
                                }
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

struct ZoneSystem2_Previews: PreviewProvider {
    static var previews: some View {
        ZoneSystem2()
    }
}

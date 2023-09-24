//
//  HelpView.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/8/23.
//

import SwiftUI

struct HelpView: View {
    var zones = Zones()
    
    var body: some View {
        GroupBox(
            label: Label("Help", systemImage: "questionmark.circle")
            .foregroundColor(.gray)
        ) {
            VStack {
                HStack {
                    Text("The zone system divides the photo into eleven zones; nine shades of gray, together with pure black and pure white. You could assume that a normal photo does not contain pure black and pure white. Therefor the nine shades of gray would be the only zones you can find in a photo.")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                ScrollView {
                    HStack {
                        VStack {
                            ForEach(0..<zones.zones.count, id: \.self) { index in
                                let zone: Zone = zones.zones[index]
                                Divider()
                                HStack {
                                    VStack {
                                        Text(zone.value)
                                    }.frame(minWidth: 30)
                                    VStack {
                                        GrayCard(zone: zone)
                                    }.frame(maxWidth: 25)
                                    VStack {
                                        Text(zone.description)
                                            .font(.caption2)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(nil)
                                            .padding(.leading)
                                    }.frame(minWidth: 300, alignment: .leading)
                                }.frame(minHeight: 30)
                            }
                        }
                    }.frame(minHeight: 50)
                    Divider()
                    HStack {
                        VStack {
                            Label("Single Exposure", systemImage: "camera.metering.matrix")
                                .font(.headline)
                                .frame(minHeight: 50)
                            Text("This is the most simple way to use Zone system but you are limited to using only one meter reading and then pick a zone for it. The app will return exposure values for all zones.")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Image("Single-Exp")
                                .resizable()
                                    .aspectRatio(contentMode: .fit)
                        }
                        
                        
                    }.frame(minHeight: 50)
                    
                    HStack {
                        VStack {
                            Label("Multi Exposure", systemImage: "camera.metering.multispot")
                                .font(.headline)
                                .frame(minHeight: 50)
                            Text("This version allows you to use two meter readings, the system will find the average of the two readings and set Zone V (or middle gray) to the mean exposure that is exactly half way between the readings. It will also display warnings when a measured reading is for instance outside the zone system, or when the metered values fall below Zone II or above Zone VIII.")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Image("Multi-Exp")
                                .resizable()
                                    .aspectRatio(contentMode: .fit)
                        }
                    }.frame(minHeight: 50)
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

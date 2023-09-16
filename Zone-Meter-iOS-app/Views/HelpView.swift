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
                                }
                            }
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
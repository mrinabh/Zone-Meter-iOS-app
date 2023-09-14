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
            .frame(minHeight: 30)
        ) {
            VStack {
                Divider()
                HStack {
                    Text("The zone system divides the photo into eleven zones; nine shades of gray, together with pure black and pure white. You could assume that a normal photo does not contain pure black and pure white. Therefore the nine shades of gray would be the only zones you can find in a photo. This app helps you determine Zone V exposure value (18% gray or middle gray) from either one or two exposure readings from your light meter.")
                        .font(.caption)
                }

                HStack {
                    VStack {
                        ForEach(0..<zones.zones.count, id: \.self) { index in
                            let zone: Zone = zones.zones[index]
                            Divider()
                            HStack {
                                VStack {
                                    Text(zone.value)
                                        .bold()
                                }.frame(minWidth: 30)
                                VStack {
                                    GrayCard(zone: zone)
                                }.frame(maxWidth: 30)
                                VStack {
                                    Text(zone.description)
                                        .font(.caption2)
                                }.frame(minWidth: 300, alignment: .leading)
                            }
                        }
                    }
                }.frame(minHeight: 50)
            }
        }
        
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

//
//  HelpView.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/8/23.
//

import SwiftUI

struct HelpView: View {
    
    // TODO: This could be moved into a common header file since it is also used in HomeView
    
    var zones = ["0", "I", "II", "III", "IV", "V",
                 "VI", "VII", "VIII", "IX", "X"]
    var zones_description = [
        "Complete lack of density in the negative image. Total black in print",
        "First step above black, slight tonality, but no texture",
        "First suggestion of texture. Deep tonalities, representing the darkest part of the image in which some detail is required",
        "Average dark materials. Low values showing adequate texture",
        "Average dark foliage. Dark stone. Landscape shadow",
        "Dark skin, gray stone, weathered wood. Middle gray",
        "Average light skin value in sunlight. Shadows on snow in sunlit snowscapes. Light stone, clear north sky",
        "Very light skin, light gray objects",
        "White with textures and delicate values",
        "Glaring white surfaces. Snow in flat sunlight White without texture",
        "Light sources, actual or reflected. Printed at maximum white value"
    ]
    
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
                HStack {
                    VStack {
                        ForEach(zones.indices, id: \.self) { zindex in
                            Divider()
                            HStack {
                                VStack {
                                    Text(zones[zindex])
                                }.frame(minWidth: 30)
                                let gray_val:Double = Double(zindex) / Double(zones.count)
                                VStack{
                                    Rectangle()
                                        .fill(Color(white: gray_val))
                                        .frame(width: 25, height: 25)
                                }.frame(maxWidth: 25)
                                VStack {
                                    Text(zones_description[zindex])
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

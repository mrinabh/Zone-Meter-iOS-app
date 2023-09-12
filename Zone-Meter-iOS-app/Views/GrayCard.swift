//
//  GrayCard.swift
//  Zone-Meter-iOS-app
//
//  Created by jens titterness on 9/9/23.
//

import SwiftUI

struct GrayCard: View {
    var gray_val: Double
    
    init(zone: Zone) {
        
        gray_val = Double(zone.id) / Double(Zones.zoneCount)
    }
    
    var body: some View {
        Rectangle()
            .fill(Color(white: gray_val))
            .frame(width: 40, height: 30)
    }
}

#Preview {
    GrayCard(zone: Zone(value: "I", id: 1, description: ""))
}

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
            .border(.black, width: 1)
    }
}

struct GrayCard_Previews: PreviewProvider {
    static var previews: some View {
        GrayCard(zone: Zone(value: "V", id: 6, description: ""))
    }
}

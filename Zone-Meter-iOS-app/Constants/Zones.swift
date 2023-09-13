import Foundation

struct Zone: Hashable {
    public let value: String
    public let id: Int
    public let description: String
    
}

struct Zones: Hashable {
    public var zones: [Zone] = []
    private let romanValues = ["0", "I", "II", "III", "IV", "V",
                               "VI", "VII", "VIII", "IX", "X"]
    public static let zoneCount = 10
    
    private var zones_description = [
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
    init() {
        for (index, roman) in romanValues.enumerated() {
            zones.append(
                Zone(
                    value: roman,
                    id: index,
                    description: zones_description[index]
                ))
        }
    }
}

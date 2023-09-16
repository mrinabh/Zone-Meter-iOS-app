//
//  AboutView.swift
//  Zone-Meter-iOS-app
//
//  Created by Mrinabh Dutta on 9/14/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        GroupBox(
            label: Label("About the developers", systemImage: "person.2")
            .foregroundColor(.gray)
        ) {
            VStack {
                Text("Zone System app was an app idea of Mrinabh & Jens - two avid film shooters from Seattle, Washington. It started off as a pet project in mid-2023 when they started putting the code together in a GitHub repository, then one thing led to another and finally led to publishing the app to the iPhone App Store.")
                    .font(.caption)
                    .frame(minHeight: 100, alignment: .top)
                
                HStack {
                    Image("mrinabh")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                    Image("jens")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                }
                
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

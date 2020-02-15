//
//  PlaceRowView.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/13.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI

struct PlaceRowView: View {
    var place: GoodPlace
    
    var body: some View {
        HStack {
            place.image.resizable().frame(width: 50, height: 50).padding(.leading, 5)
            Text(place.name)
            Spacer()
            if (place.isFavorite) {
                Image(systemName: "star.fill").imageScale(.medium).foregroundColor(.yellow)
            }
        }
    }
}

struct PlaceRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceRowView(place: placesData[0])
            PlaceRowView(place: placesData[1])
        }.previewLayout(.fixed(width: 320, height: 70))
    }
}

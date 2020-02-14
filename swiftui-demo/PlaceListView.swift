//
//  PlaceListView.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/14.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI

struct PlaceListView: View {
    var body: some View {
        NavigationView {
            List (placesData) { place in
                NavigationLink(destination: DetailView()) {
                    PlaceRowView(place: place)
                }
            }
            .navigationBarTitle(Text("All Good Places"))
        }
        
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView()
    }
}

//
//  PlaceListView.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/14.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI

struct PlaceListView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle (isOn: $userData.showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(userData.places) { place in
                    if !self.userData.showFavoritesOnly
                        || place.isFavorite {
                        NavigationLink(destination: DetailView(place: place)) {
                            PlaceRowView(place: place)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("All Good Places"))
        }
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView().environmentObject(UserData())
    }
}

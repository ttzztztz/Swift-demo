//
//  DetailView.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/14.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var userData: UserData
    var place: GoodPlace
    
    var placeIndex: Int {
        userData.places.firstIndex(where: {$0.id == place.id})!
    }
    
    @State private var showingAlert = false
    var body: some View {
        VStack {
            MapView(latitude: place.location.latitude, longitude: place.location.longitude).frame(height: 300).cornerRadius(36)
            CircleImage(image: place.image).offset(y: -128).padding(.bottom, -96)
            VStack (alignment: .leading) {
                HStack {
                    Text(place.name).font(.title).foregroundColor(.red)
                    Button(action: {
                        self.userData.places[self.placeIndex].isFavorite.toggle()
                    }) {
                        if self.userData.places[self.placeIndex].isFavorite {
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star").foregroundColor(.gray)
                        }
                    }
                }
                
                HStack {
                    Text(place.description).font(.subheadline)
                    Spacer()
                    Text(place.type == PlaceType.hotel ? "Hotel" : "Transportation").font(.subheadline)
                }
            }
            Button(action: {
                self.showingAlert = true
            }) {
                Text("はい！🤔")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("hi!!!"), message: Text("test!!!"))
            }
        }
        .padding()
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(place: placesData[0])
    }
}

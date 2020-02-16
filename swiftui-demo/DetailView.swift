//
//  DetailView.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/14.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension Animation {
    static var ripple: Animation {
        Animation.spring(dampingFraction: 0.5).speed(2)
    }
}

struct DetailView: View {
    @EnvironmentObject var userData: UserData
    var place: GoodPlace
    
    var placeIndex: Int {
        userData.places.firstIndex(where: {$0.id == place.id})!
    }
    
    @State private var showingAlert = false
    @State private var showDetail = true
    var body: some View {
        VStack {
            MapView(latitude: place.location.latitude, longitude: place.location.longitude).frame(height: 300).cornerRadius(36)
            CircleImage(image: place.image).offset(y: -128).padding(.bottom, -96).animation(.ripple)
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
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.showDetail.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.right.circle")
                            .imageScale(.large)
                            .rotationEffect(
                                .degrees(showDetail ? 90 : 0))
                            .animation(.spring())
                    }
                }
                
                if self.showDetail {
                    HStack {
                        Text(place.description).font(.subheadline)
                        Spacer()
                        Text(place.type == PlaceType.hotel ? "Hotel" : "Transportation").font(.subheadline)
                    }.transition(.moveAndFade)
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
        DetailView(place: placesData[0]).environmentObject(UserData())
    }
}

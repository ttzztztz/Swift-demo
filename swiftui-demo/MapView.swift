//
//  MapView.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/13.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 39.851288, longitude: 119.419926)
    }
}

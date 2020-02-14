//
//  Place.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/13.
//  Copyright © 2020 杨子越. All rights reserved.
//
import SwiftUI
import CoreLocation

struct GoodPlace : Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var description: String
    var type: PlaceType
    
    fileprivate var coordinates: Coordinates
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude
        )
    }
}

enum PlaceType : String, CaseIterable, Codable, Hashable {
    case transportation = "Transportation"
    case hotel = "Hotel"
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

extension GoodPlace {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

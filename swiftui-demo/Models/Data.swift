//
//  Data.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/14.
//  Copyright © 2020 杨子越. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

let placesData: [GoodPlace] = load("Places.json")
func load<T: Decodable>(_ filename: String)->T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("could't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldn't load \(filename) from main bundle \n \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("couldn't parse \(filename) as \(T.self): \n \(error)")
    }
    
}

final class ImageStore {
    fileprivate typealias ImageDictionary = [String: CGImage]
    fileprivate var images: ImageDictionary = [:]
    fileprivate static var scale = 2
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }
    
    static func loadImage(name: String)->CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
            else {
                fatalError("Couldn't load image \(name).jpg from main bundle")
        }
        return image
    }
    
    fileprivate func guaranteeImage(name: String) ->ImageDictionary.Index {
        if let index = images.index(forKey: name) {
            return index
        }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}

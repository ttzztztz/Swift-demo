//
//  CircleImage.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/12.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image.resizable().frame(width: 196, height: 196, alignment: .top).clipShape(Circle())
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("yosemite"))
    }
}

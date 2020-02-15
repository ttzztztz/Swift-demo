//
//  UserData.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/15.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var places = placesData
}

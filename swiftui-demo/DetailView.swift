//
//  DetailView.swift
//  swiftui-demo
//
//  Created by 杨子越 on 2020/2/14.
//  Copyright © 2020 杨子越. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State private var showingAlert = false
    var body: some View {
        VStack {
            MapView().frame(height: 300).cornerRadius(36)
            CircleImage().offset(y: -128).padding(.bottom, -96)
            VStack (alignment: .leading) {
                Text("Beidaihe Railway station").font(.headline).foregroundColor(.red)
                HStack {
                    Text("おはようございます").font(.subheadline)
                    Spacer()
                    Text("Transportation").font(.subheadline)
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
        DetailView()
    }
}

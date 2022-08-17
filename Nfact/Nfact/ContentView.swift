//
//  ContentView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("hoony's home")
                .tabItem{
                    Image(systemName: "house")
                    Text("홈")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

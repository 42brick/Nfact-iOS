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
          HomeView()
                .environmentObject(HomeViewModel())
            .tabItem {
              Image(systemName: "1.square.fill")
              Text("홈")
            }
          Text("Another Tab")
            .tabItem {
              Image(systemName: "2.square.fill")
              Text("Second")
            }
          Text("The Last Tab")
            .tabItem {
              Image(systemName: "3.square.fill")
              Text("Third")
            }
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
              .environmentObject(HomeViewModel())
        .font(.headline)
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

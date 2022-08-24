//
//  HomeView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                MyNftListView()
                MyNftListView()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .navigationTitle("홈")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

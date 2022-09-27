//
//  HomeView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                WalletCardView(isClickEditButton: $viewModel.isShowEditView)
                    .sheet(isPresented: $viewModel.isShowEditView, content: {
                        EditWalletView()
                            .environmentObject(EditWalletViewModel())
                    })
                
                NftListView(nfts: viewModel.nfts, isClickDetailButton: $viewModel.isShowDetailView)
                
                NavigationLink(destination: DetailView(), isActive: $viewModel.isShowDetailView) {
                }.hidden()
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .navigationTitle("홈")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

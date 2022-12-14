//
//  HomeView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                WalletCardView(wallet: $viewModel.output.wallet,isClickEditButton: $viewModel.isShowEditView)
                    .sheet(isPresented: $viewModel.isShowEditView, onDismiss: {viewModel.apply(.refresh)}, content: {
                        EditWalletView(isDismiss: $viewModel.isShowEditView)
                            .environmentObject(EditWalletViewModel())
                    })
                
                NftListView(nfts: $viewModel.output.nfts, isClickDetailButton: $viewModel.isShowDetailView, selectedNft: $viewModel.selectedNft)
                
                NavigationLink(destination: DetailView(nft: $viewModel.selectedNft), isActive: $viewModel.isShowDetailView) {
                }.hidden()
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .navigationTitle("홈")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

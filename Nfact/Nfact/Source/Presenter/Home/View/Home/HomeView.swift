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
    @State var wallet: Wallet = Wallet(id: 0, name: "", address: "", chain: .eth)
    
    var body: some View {
        NavigationView {
            ScrollView {
                WalletCardView(wallet: $wallet,isClickEditButton: $viewModel.isShowEditView)
                    .sheet(isPresented: $viewModel.isShowEditView, content: {
                        EditWalletView()
                            .environmentObject(EditWalletViewModel())
                    })
                
                NftListView(nfts: viewModel.nfts, isClickDetailButton: $viewModel.isShowDetailView, selectedNft: $viewModel.selectedNft)
                
                NavigationLink(destination: DetailView(nft: $viewModel.selectedNft), isActive: $viewModel.isShowDetailView) {
                }.hidden()
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .navigationTitle("홈")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

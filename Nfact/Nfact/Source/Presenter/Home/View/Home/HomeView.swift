//
//  HomeView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI
import PhotosUI
import Combine

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    WalletCardView(wallet: $viewModel.output.wallet,isClickEditButton: $viewModel.isShowEditView)
                        .sheet(isPresented: $viewModel.isShowEditView, onDismiss: {viewModel.apply(.refresh)}, content: {
                            EditWalletView(isDismiss: $viewModel.isShowEditView)
                                .environmentObject(EditWalletViewModel())
                        })
                    
                    NftListView(nfts: $viewModel.output.nfts, isClickDetailButton: $viewModel.isShowDetailView, selectedNft: $viewModel.selectedNft)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .navigationTitle("홈")
                .navigationBarTitleDisplayMode(.large)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        PhotosPicker(
                            selection: $viewModel.selectedItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                                Image(systemName: "plus")
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color.white)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                            }
                            .onChange(of: viewModel.selectedItem) { newItem in
                                Task {
                                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                        viewModel.selectedImageData = data
                                        self.viewModel.apply(.presentFactory)
                                    }
                                }
                            }                        .padding()
                    }
                }
                NavigationLink(destination: FactoryView(imageData: $viewModel.selectedImageData), isActive: $viewModel.isShowFactoryView) {
                }.hidden()
                
                
                NavigationLink(destination: DetailView(nft: $viewModel.selectedNft), isActive: $viewModel.isShowDetailView) {
                }.hidden()
            }
        }
    }
}

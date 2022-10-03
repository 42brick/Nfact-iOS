//
//  HomeViewModel.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    private var repository: RepositoryProvider = RepositoryProvider.shared
    private var cancellables: [AnyCancellable] = []
    
    @Published var wallet: Wallet = Wallet(id: 0, name: "", address: "", chain: .eth)
    @Published var nfts: [Nft] = []
    @Published var isShowEditView: Bool = false
    @Published var isShowDetailView: Bool = false
    @Published var selectedNft: Nft?
    
    
    private var service: ServiceProvidable = ServiceProvider.shared
    
    init() {
        bind()
    }
    
    private func bind() {
        wallet = service.walletService.readWallet(on: 0)
        
        repository.nftRepository.getNftData(request: .init(addr: UserSettings.shared.firstWalletAddress, symbol: .eth))
            .receive(on: RunLoop.main, options: .none)
            .sink { (completion) in
                switch completion {
                case .failure(let error): print(error)
                case .finished: break
                }
            } receiveValue: { (response) in
                self.nfts = response.nftResult.result
                print(self.nfts)
            }
            .store(in: &cancellables)
    }
    
    private func bindOutputs() {
        
    }
}

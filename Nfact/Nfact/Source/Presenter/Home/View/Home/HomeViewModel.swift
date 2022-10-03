//
//  HomeViewModel.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    let didChange = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []
    
    @Published var isShowEditView: Bool = false
    @Published var isShowDetailView: Bool = false
    @Published var selectedNft: Nft?
    
    enum Input {
        case refresh
    }
    
    func apply(_ input: Input) {
        switch input {
        case .refresh:
            refreshSubject.send(())
        }
    }
    
    private let refreshSubject = PassthroughSubject<Void, Never>()
    
    struct Output {
        var wallet: Wallet = Wallet(id: 0, name: "", address: "", symbol: .eth)
        var nfts: [Nft] = []
    }
    
    @Published var output = Output() {
        didSet {
            didChange.send(())
        }
    }
    
    private var service: ServiceProvidable = ServiceProvider.shared
    
    init() {
        bind()
        
        refreshSubject.send(())
    }
    
    private func bind() {
        refreshSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] in
                guard let `self` = self else { return }
                
                self.fetchWallet()
                self.fetchNfts()
            })
            .store(in: &cancellables)
    }
    
    private func fetchWallet() {
        output.wallet = service.walletService.readWallet(on: 0)
    }
    
    private func fetchNfts() {
        RepositoryProvider.shared.nftRepository.getNftData(request: .init(addr: output.wallet.address, symbol: output.wallet.symbol))
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveCompletion: ({ _ in }),
                  receiveValue: ({ [weak self] (response) in
                guard let `self` = self else { return }
                self.output.nfts = response.nftResult.result
            }))
            .store(in: &cancellables)
    }
}

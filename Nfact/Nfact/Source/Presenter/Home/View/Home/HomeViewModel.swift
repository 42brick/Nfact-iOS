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
    
    @Published var nfts: [Nft] = []
    @Published var isShowEditView: Bool = false
    @Published var isShowDetailView: Bool = false
    @Published var selectedNft: Nft?
    
    init() {
        bind()
        //        bindOutputs()
        
        //        repository.nftRepository.getNftData(request: .init(addr: "0xCB76200a088672E18E57A4381264aa82eAE14875", symbol: .eth)).sink { (completion) in
        //            switch completion {
        //            case .failure(let error):
        //                print("oops got an error \(error.localizedDescription)")
        //            case .finished:
        //                print("nothing much to do here")
        //            }
        //        } receiveValue: { (response) in
        //            print("got my response here \(response.nftResult.result)")
        //        }
        //        .store(in: &cancellables)
    }
    
    private func bind() {
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

//
//  EditWalletViewModel.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import Combine
import SwiftUI

class EditWalletViewModel: ObservableObject {
    let didChange = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []
    
    @Published var name: String = "" {
        willSet {
            didPutNameSubject.send(name)
        }
    }
    @Published var address: String = "" {
        willSet {
            didPutAddressSubject.send(address)
        }
    }
    
    enum Input {
        case didTapChain(type: ChainType)
        case didTapSaveButton
    }
    
    func apply(_ input: Input) {
        switch input {
        case let .didTapChain(type):
            didTapChainSubject.send(type)
        case .didTapSaveButton:
            didTapSaveButtonSubject.send(())
        }
    }
    
    private let didPutNameSubject = PassthroughSubject<String, Never>()
    private let didPutAddressSubject = PassthroughSubject<String, Never>()
    private let didTapChainSubject = PassthroughSubject<ChainType, Never>()
    private let didTapSaveButtonSubject = PassthroughSubject<Void, Never>()
    
    struct Output {
        var wallet: Wallet = Wallet(id: 0, name: "", address: "", chain: .eth)
    }
    
    var output = Output()
    
//    private(set) var output = Output() {
//        didSet {
//            didChange.send(())
//        }
//    }
    
    init() {
        bind()
    }
    
    func bind() {
        didPutNameSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] name in
                self?.output.wallet.name = name
            })
            .store(in: &cancellables)
        
        didPutAddressSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] address in
                self?.output.wallet.address = address
            })
            .store(in: &cancellables)
        
        didTapChainSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] type in
                self?.output.wallet.chain = type
            })
            .store(in: &cancellables)
    }
}

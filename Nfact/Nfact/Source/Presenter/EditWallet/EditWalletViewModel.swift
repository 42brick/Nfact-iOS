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
        case didTapChain(type: SymbolType)
        case didTapSaveButton
    }
    
    func apply(_ input: Input) {
        switch input {
        case let .didTapChain(type):
            didTapSymbolSubject.send(type)
        case .didTapSaveButton:
            didTapSaveButtonSubject.send(())
        }
    }
    
    private let didPutNameSubject = PassthroughSubject<String, Never>()
    private let didPutAddressSubject = PassthroughSubject<String, Never>()
    private let didTapSymbolSubject = PassthroughSubject<SymbolType, Never>()
    private let didTapSaveButtonSubject = PassthroughSubject<Void, Never>()
    
    struct Output {
        var wallet: Wallet = Wallet(id: 0, name: "", address: "", symbol: .eth)
    }
    
    @Published var output = Output() {
        didSet {
            didChange.send(())
        }
    }
    
    private var service: ServiceProvidable = ServiceProvider.shared
    
    init() {
        bind()
    }
    
    func bind() {
        output.wallet = service.walletService.readWallet(on: 0)
        
        didPutNameSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] name in
                self?.output.wallet.name = name
            })
            .store(in: &cancellables)
        
        didPutAddressSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] address in
                if address.isEmpty {
                    self?.output.wallet.address = ""
                } else {
                    self?.output.wallet.address = address
                }
            })
            .store(in: &cancellables)
        
        didTapSymbolSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] type in
                self?.output.wallet.symbol = type
            })
            .store(in: &cancellables)
        
        didTapSaveButtonSubject
            .receive(on: RunLoop.main, options: .none)
            .sink(receiveValue: { [weak self] in
                guard let this = self else { return }
                
                this.service.walletService.updateWallet(with: this.output.wallet)
            })
            .store(in: &cancellables)
    }
}

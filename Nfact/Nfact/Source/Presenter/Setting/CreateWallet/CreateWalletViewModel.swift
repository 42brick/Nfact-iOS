//
//  CreateWalletViewModel.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/13.
//

import SwiftUI
import Combine

class CreateWalletViewModel: ObservableObject {
    private var userSettings: UserSettings = UserSettings.shared
    private var repository: RepositoryProvider = RepositoryProvider.shared
    private var cancellables: [AnyCancellable] = []
    
    @Published var firstWalletAddress: String = "124241"
    @Published var secondWalletAddress: String = String()
    @Published var thirdWalletAddress: String = String()
    
    var tapButtonSubject = PassthroughSubject<Void, Never>()
    
    init() {
        bind()
    }
    
    func bind() {
        firstWalletAddress = userSettings.firstWalletAddress
        secondWalletAddress = userSettings.secondWalletAddress
        thirdWalletAddress = userSettings.thirdWalletAddress
        
        tapButtonSubject
            .sink(receiveValue: { [weak self] in
                guard let this = self else { return }
                print(this.firstWalletAddress)
                print(this.secondWalletAddress)
                print(this.thirdWalletAddress)
                
                this.userSettings.firstWalletAddress = this.firstWalletAddress
                this.userSettings.secondWalletAddress = this.secondWalletAddress
                this.userSettings.thirdWalletAddress = this.thirdWalletAddress
            })
            .store(in: &cancellables)
    }
}

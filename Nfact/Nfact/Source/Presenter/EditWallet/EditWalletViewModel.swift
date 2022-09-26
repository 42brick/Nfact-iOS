//
//  EditWalletViewModel.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import Combine

class EditWalletViewModel: ObservableObject {
    private var cancellables: [AnyCancellable] = []
    
    private var userSettings: UserSettings = UserSettings.shared
    private var repository: RepositoryProvider = RepositoryProvider.shared
    
    @Published var name: String = String()
    @Published var adress: String = String()
    @Published var chain: String = String()

    var tapButtonSubject = PassthroughSubject<Void, Never>()
    
    init() {
        bind()
    }
    
    func bind() {
        
    }
}

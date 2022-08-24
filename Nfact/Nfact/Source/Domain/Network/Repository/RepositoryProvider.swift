//
//  RepositoryProvider.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation

protocol RepositoryProvidable {
    var nftRepository: NftRepositable { get }
}

class RepositoryProvider: RepositoryProvidable {
    static let shared = RepositoryProvider()
    
    var nftRepository: NftRepositable = NftRepository(networkRequest: DefaultNetworkRequest())
    
    private init() { }
}

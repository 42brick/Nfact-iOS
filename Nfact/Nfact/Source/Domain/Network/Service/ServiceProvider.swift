//
//  ServiceProvider.swift
//  Nfact
//
//  Created by 송영모 on 2022/10/03.
//

import Foundation

protocol ServiceProvidable {
    var walletService: WalletServicable { get }
}

class ServiceProvider: ServiceProvidable {
    static let shared = ServiceProvider()
    
    var walletService: WalletServicable = WalletService()
    
    private init() { }
}

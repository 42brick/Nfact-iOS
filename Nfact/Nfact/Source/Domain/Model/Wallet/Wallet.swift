//
//  Wallet.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import Foundation
import RealmSwift

struct Wallet {
    var id: Int
    var name: String = ""
    var address: String = ""
    var chain: ChainType = .bsc
    
    static func parse(from realm: WalletRealm) -> Self {
        return Wallet(id: realm.id, name: realm.name, address: realm.address, chain: realm.chain)
    }
}

class WalletRealm: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String = ""
    @Persisted var address: String = ""
    @Persisted var chain: ChainType = .bsc
    
    convenience init(id: Int, name: String, address: String, chain: ChainType) {
        self.init()
        
        self.id = id
        self.name = name
        self.address = address
        self.chain = chain
    }
    
    static func parse(from origin: Wallet) -> WalletRealm {
        return WalletRealm(id: origin.id, name: origin.name, address: origin.address, chain: origin.chain)
    }
}

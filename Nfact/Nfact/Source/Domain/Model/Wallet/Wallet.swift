//
//  Wallet.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import Foundation
import RealmSwift

class Wallet: Object {
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
}

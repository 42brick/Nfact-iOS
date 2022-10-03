//
//  WalletService.swift
//  Nfact
//
//  Created by 송영모 on 2022/10/03.
//

import Combine
import RealmSwift

protocol WalletServicable {
    func createWallet(with wallet: Wallet)
    func readWallet(on id: Int) -> Wallet
    func updateWallet(with wallet: Wallet)
}

class WalletService: WalletServicable {
    let realm = try! Realm()
    
    func createWallet(with wallet: Wallet) {
        try! realm.write {
            realm.add(wallet)
        }
    }
    
    func readWallet(on id: Int) -> Wallet {
        if let wallet = realm.object(ofType: Wallet.self, forPrimaryKey: id) {
            return wallet
        } else {
            createWallet(with: Wallet(id: id, name: "", address: "", chain: .eth))
        }
        
        return realm.object(ofType: Wallet.self, forPrimaryKey: id)!
    }
    
    func updateWallet(with wallet: Wallet) {
        try! realm.write {
            realm.add(wallet, update: .modified)
        }
    }
}

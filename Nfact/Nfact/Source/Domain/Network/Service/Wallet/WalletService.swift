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
            realm.add(WalletRealm.parse(from: wallet))
            print("[D] Wallet 생성")
        }
    }
    
    func readWallet(on id: Int) -> Wallet {
        if let walletRealm = realm.object(ofType: WalletRealm.self, forPrimaryKey: id) {
            print("[D] Wallet 읽어오기")
            return Wallet.parse(from: walletRealm)
        } else {
            createWallet(with: Wallet(id: id, name: "", address: "", symbol: .eth))
        }
        
        return Wallet.parse(from: realm.object(ofType: WalletRealm.self, forPrimaryKey: id)!)
    }
    
    func updateWallet(with wallet: Wallet) {
        try! realm.write {
            realm.add(WalletRealm.parse(from: wallet), update: .modified)
            print("[D] Wallet 업데이트")
        }
    }
}

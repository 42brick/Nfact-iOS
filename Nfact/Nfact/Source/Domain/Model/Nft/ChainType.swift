//
//  ChainType.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import Foundation
import RealmSwift

enum ChainType: String, Codable, PersistableEnum {
    static var list: [ChainType] = [.eth, .bsc, .matic, .ftm]
    
    case eth = "Ethereum"
    case bsc = "Binance Smart Chain"
    case matic = "Polygon"
    case ftm = "Fantom"
}

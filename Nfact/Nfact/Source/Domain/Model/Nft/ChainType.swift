//
//  ChainType.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import Foundation
import RealmSwift

enum ChainType: String, Codable, PersistableEnum {
    case eth = "Ethereum"
    case bsc = "Binance Smart Chain"
    case matic = "Polygon"
    case ftm = "Fantom"
}

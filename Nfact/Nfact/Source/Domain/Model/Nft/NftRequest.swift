//
//  GetNftQurey.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation

struct NftRequest: Codable {
    let addr: String
    let symbol: SymbolType
}

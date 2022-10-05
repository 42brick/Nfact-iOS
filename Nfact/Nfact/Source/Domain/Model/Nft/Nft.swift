//
//  NftData.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation
import RealmSwift

enum SymbolType: String, Codable, PersistableEnum {
    case eth = "eth"
    case bsc = "bsc"
    case matic = "matic"
    case ftm = "ftm"
}

// MARK: - NftData
struct NftData: Codable {
    let chain: ChainType
    let symbol: SymbolType
    let nftResult: NftResult
    
    enum CodingKeys: String, CodingKey {
        case chain, symbol
        case nftResult = "result"
    }
}

// MARK: - NftResult
struct NftResult: Codable {
    let total, page, pageSize: Int
    let cursor: String?
    let result: [Nft]
    let status: String?

    enum CodingKeys: String, CodingKey {
        case total, page
        case pageSize = "page_size"
        case cursor, result, status
    }
}

// MARK: - Nft
struct Nft: Codable, Hashable {
    let id: String
    let tokenAddress: String
    let amount: String?
    let ownerOf: String
    let tokenHash, blockNumberMinted, blockNumber: String
    let contractType: String?
    let name, symbol: String
    let tokenURI: String?
    let image: String?
    let metadata: String?
    let lastTokenURISync: String?
    let lastMetadataSync: String?

    enum CodingKeys: String, CodingKey {
        case id = "token_id"
        case tokenAddress = "token_address"
        case amount
        case ownerOf = "owner_of"
        case tokenHash = "token_hash"
        case blockNumberMinted = "block_number_minted"
        case blockNumber = "block_number"
        case contractType = "contract_type"
        case name, symbol
        case tokenURI = "token_uri"
        case image, metadata
        case lastTokenURISync = "last_token_uri_sync"
        case lastMetadataSync = "last_metadata_sync"
    }
}

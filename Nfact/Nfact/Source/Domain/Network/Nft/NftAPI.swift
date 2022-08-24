//
//  NftAPI.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation

enum NftAPI {
    case getNftData(GetNftRequest)
}

extension NftAPI: NetworkAPI {
    var requestTimeOut: Float? {
        return 20
    }
    
    var baseURL: String {
        return Environment.url
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNftData:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .getNftData:
            return baseURL + "/nft"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case let .getNftData(param):
            return .query(param)
        }
    }
}

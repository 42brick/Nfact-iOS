//
//  NftRepository.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation
import Combine

protocol NftRepositable {
    func getNftData(request: GetNftRequest) -> AnyPublisher<NftData, NetworkError>
}

class NftRepository: NftRepositable {
    var networkRequest: Requestable
    
    // MARK: - Initializer
    
    init(networkRequest: Requestable) {
        self.networkRequest = networkRequest
    }
    
    func getNftData(request: GetNftRequest) -> AnyPublisher<NftData, NetworkError> {
        return networkRequest.request(NftAPI.getNftData(request))
    }
}

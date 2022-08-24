//
//  NftRepository.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation
import Combine

//protocol PurchaseServiceable {
//    func purchaseProduct(request: PurchaseRequest) -> AnyPublisher<PurchaseResponse, NetworkError>
//    func getProduct(productId: Int) -> AnyPublisher<Product, NetworkError>
//  //Instead of using Void I use NoReply for requests that might give 200 with empty response
//    func cancelOrder(_ orderId: Int) -> AnyPublisher<NoReply, NetworkError>
//}

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

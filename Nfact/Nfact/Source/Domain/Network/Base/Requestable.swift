//
//  Requestable.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Combine
import Foundation

protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request<T: Codable>(_ req: NetworkAPI) -> AnyPublisher<T, NetworkError>
}

class DefaultRequestable: Requestable {
    var requestTimeOut: Float = 20
    
    func request<T>(_ req: NetworkAPI) -> AnyPublisher<T, NetworkError> where T : Decodable, T : Encodable {
        let sessionConfig = URLSessionConfiguration.default
               sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
               
               guard let url = URL(string: req.path) else {
                   // Return a fail publisher if the url is invalid
                   return AnyPublisher(
                       Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url"))
                   )
               }
               // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
               return URLSession.shared
                   .dataTaskPublisher(for: req.asURLRequest(with: url))
                   .tryMap { output in
                            // throw an error if response is nil
                       guard output.response is HTTPURLResponse else {
                           throw NetworkError.serverError(code: 0, error: "Server error")
                       }
                       return output.data
                   }
                   .decode(type: T.self, decoder: JSONDecoder())
                   .mapError { error in
                              // return error if json decoding fails
                       NetworkError.invalidJSON(String(describing: error))
                   }
                   .eraseToAnyPublisher()
    }
    
    
}

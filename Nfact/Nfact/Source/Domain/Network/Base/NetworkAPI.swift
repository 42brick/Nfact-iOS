//
//  NetworkAPI.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum RequestParams {
    case query(_ parameter: Encodable)
    case body(_ parameter: Encodable)
    case both(_ queryParameter: Encodable, _ bodyParameter: Encodable)
}

enum NetworkError: Error, Equatable {
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case invalidJSON(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknown(code: Int, error: String)
}

protocol NetworkAPI {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams? { get }
    var requestTimeOut: Float? { get }
}

extension NetworkAPI {
    func asURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.code, forHTTPHeaderField: HTTPHeaderField.contentType.code)
        
        switch parameters {
        case let .query(param):
            let dict = param.toDictionary()
            let qureyItems = dict.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: path)
            
            components?.queryItems = qureyItems
            urlRequest.url = components?.url
        case let .body(param):
            do {
                let body = try JSONEncoder().encode(AnyEncodable(param))
                urlRequest.httpBody = body
            } catch {
                break
            }
        case let .both(queryParam, bodyParam):
            let dict = queryParam.toDictionary()
            let qureyItems = dict.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: path)
            
            components?.queryItems = qureyItems
            urlRequest.url = components?.url
            do {
                let body = try JSONEncoder().encode(AnyEncodable(bodyParam))
                urlRequest.httpBody = body
            } catch {
                break
            }
        default:
            print("param is nil")
        }
        
        return urlRequest
    }
}

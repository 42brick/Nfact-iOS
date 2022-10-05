//
//  HTTPHeaderField.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation

enum HTTPHeaderField {
    case authentication
    case contentType
    case acceptType
    
    var code: String {
        switch self {
        case .authentication:
            return "Autorization"
        case .contentType:
            return "Content-Type"
        case .acceptType:
            return "Accept"
        }
    }
}

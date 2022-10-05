//
//  ContentType.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation

enum ContentType {
    case json
    
    var code: String {
        switch self {
        case .json:
            return "application/json"
        }
    }
}

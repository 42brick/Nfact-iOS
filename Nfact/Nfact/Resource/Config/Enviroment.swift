//
//  Enviroment.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Foundation

struct Environment {
    static let url: String = Bundle.main.object(forInfoDictionaryKey: "SERVER_HOST") as? String ?? ""
}

//
//  InfoItemView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/28.
//

import SwiftUI

enum InfoItemType {
    case tokenId
    case ownerOf
    case symbol
    case contractType
    
    var title: String {
        switch self {
        case .tokenId:
            return "아이디"
        case .ownerOf:
            return "소유자"
        case .symbol:
            return "심볼"
        case .contractType:
            return "컨트렉트"
        }
    }
    
    var imageName: String {
        switch self {
        case .tokenId:
            return "i.square"
        case .ownerOf:
            return "person.text.rectangle"
        case .symbol:
            return "dollarsign.square"
        case .contractType:
            return "checkmark.shield"
        }
    }
    
    func parse(from string: String) -> Self {
        switch string {
        case "token_id":
            return .tokenId
        case "owner_of":
            return .ownerOf
        case "symbol":
            return .symbol
        case "contract_type":
            return .contractType
        default:
            return .tokenId
        }
    }
}

struct InfoItemView: View {
    let type: InfoItemType
    let sub: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(type.title)
                .font(.caption2)
                .bold()
                .foregroundColor(.gray)
            
            Image(systemName: type.imageName)
                .imageScale(.large)
            
            Text(sub)
                .lineLimit(1)
                .font(.caption)
                .foregroundColor(.gray)
                
        }
    }
}

//
//  NftListItemView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct NftListItemView: View {
    @Binding var isClickDetailButton: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "paperplane.circle.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .padding(.trailing, 2)
            
            VStack(alignment: .leading) {
                Text("name")
                    .font(.body)
                    .foregroundColor(.black)
                
                Text("symbol")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button() {
                isClickDetailButton = true
            } label: {
                Text("상세보기")
            }
            .buttonStyle(.bordered)
            .tint(.blue)
        }
    }
}

struct NftListView: View {
    let nfts: [Nft]
    @Binding var isClickDetailButton: Bool
    
    @State var dummy = ["Hohyeon", "Moon", "Jigom"]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(dummy, id: \.self) { nft in
                    NftListItemView(isClickDetailButton: $isClickDetailButton)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                }
            }
        }
    }
}

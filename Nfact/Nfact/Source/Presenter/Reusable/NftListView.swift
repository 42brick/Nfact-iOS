//
//  NftListItemView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct NftListItemView: View {
    let nft: Nft
    
    var body: some View {
        HStack {
            Text("0")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding()
                .background(
                    Circle()
                        .foregroundColor(.blue)
                        .padding(6)
                )
            VStack {
                Text("\(nft.name)")
                    .font(.title3)
                    .foregroundColor(.black)
                
                Text("\(nft.symbol)")
                    .font(.body)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "chevron.right")
            }
        }
    }
}

struct NftListView: View {
    let nfts: [Nft]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(nfts, id: \.self) { nft in
                    NftListItemView(nft: nft)
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

//
//  NftListItemView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct NftListItemView: View {
    let nft: Nft
    @Binding var isClickDetailButton: Bool
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: nft.image ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 35, height: 35)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 35, maxHeight: 35)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 40)
            
            VStack(alignment: .leading) {
                Text(nft.name)
                    .font(.body)
                    .foregroundColor(.black)
                
                Text(nft.symbol)
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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(nfts, id: \.self) { nft in
                    NftListItemView(nft: nft, isClickDetailButton: $isClickDetailButton)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                }
            }
        }
    }
}

//
//  DetailView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/27.
//

import SwiftUI

struct DetailView: View {
    @Binding var nft: Nft?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 10) {
                    AsyncImage(url: URL(string: nft?.image ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 100, height: 100)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(nft?.name ?? "")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(nft?.tokenAddress ?? "")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Text("토큰 주소 복사")
                                .font(.subheadline)
                        }
                        .buttonStyle(.bordered)
                        .tint(.green)
                    }
//                    .frame(height: 100)
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        if let nft = nft {
                            let width: CGFloat = 70
                            
                            InfoItemView(type: .ownerOf, sub: nft.ownerOf)
                                .frame(width: width)
                            
                            InfoItemView(type: .tokenId, sub: nft.id)
                                .frame(width: width)
                            
                            InfoItemView(type: .symbol, sub: nft.symbol)
                                .frame(width: width)
                            
                            InfoItemView(type: .contractType, sub: nft.contractType ?? "")
                                .frame(width: width)
                        }
                    }
                }
                
                Divider()
                    .padding(.vertical)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("상세 정보")
                        .font(.title3)
                        .bold()
                    
                    Text("세부 내용입니다. 어쩌구 저쩌구")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

//
//  NftListItemView.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/17.
//

import SwiftUI

struct MyNftListItemView: View {
    var body: some View {
        HStack {
            Text("1")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding()
                .background(
                    Circle()
                        .foregroundColor(.blue)
                        .padding(6)
                )
            VStack {
                Text("test")
                    .font(.title3)
                    .foregroundColor(.black)
                
                Text("ddd")
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

struct MyNftListView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(0..<20) { i in
                    MyNftListItemView()
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

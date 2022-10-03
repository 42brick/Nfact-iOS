//
//  WalletCardView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import Combine
import SwiftUI

struct WalletCardView: View {
    @Binding var wallet: Wallet
    @Binding var isClickEditButton: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(wallet.name)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    Button(action: {
                        isClickEditButton = true
                    }) {
                        Image(systemName: "creditcard")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                }
                .padding([.top, .leading])
                
                HStack {
                    Image(systemName: "key")
                        .imageScale(.small)
                        .foregroundColor(.white)
                    
                    Text(wallet.address)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "doc.on.doc")
                            .imageScale(.small)
                            .foregroundColor(.white)
                    }
                }
                .padding([.top, .leading, .trailing])
                
                HStack {
                    Image(systemName: "link")
                        .imageScale(.small)
                        .foregroundColor(.white)
                    
                    Text(String(describing: wallet.chain))
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .lineLimit(1)
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                .padding([.leading, .trailing, .bottom])
                
//                HStack {
//                    Image(systemName: "clock")
//                        .imageScale(.small)
//                        .foregroundColor(.white)
//
//                    Text("2022년 10월 24일 12시 57분 19초")
//                        .foregroundColor(.white)
//                        .font(.subheadline)
//                        .lineLimit(1)
//                }
//                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
//                .padding([.leading, .trailing, .bottom])
            }
            .background(.blue)
        }
        .cornerRadius(15)
        .padding()
    }
}

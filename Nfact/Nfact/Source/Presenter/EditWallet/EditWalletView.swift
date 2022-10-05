//
//  EditWalletView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import SwiftUI
import Combine

struct EditWalletView: View {
    @EnvironmentObject var viewModel: EditWalletViewModel
    @Binding var isDismiss: Bool
    @State var tmp: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            WalletCardView(wallet: $viewModel.output.wallet, isClickEditButton: $tmp)
                .padding(.vertical)
            
            HStack {
                Image(systemName: "creditcard")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 15, maxHeight: 15)
                
                TextField("닉네임", text: $viewModel.name)
                    .padding(.vertical)
            }
            
            Divider()
            
            HStack {
                Image(systemName: "key")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 15, maxHeight: 15)
                
                TextField("주소", text: $viewModel.address)
                    .padding(.vertical)
            }
            
            Divider()
            
            HStack {
                Image(systemName: "link")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 15, maxHeight: 15)
                
                HStack {
                    ForEach(SymbolType.allCases, id: \.self) { (type) in
                        Button(action: {
                            viewModel.apply(.didTapChain(type: type))
                        }) {
                            Text(String(describing: type))
                                .font(.footnote)
                                .bold()
                        }
                        .tint(.blue)
                        .buttonStyle(.bordered)
                    }
                }
            }
            .padding(.vertical)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {
                    viewModel.apply(.didTapSaveButton)
                    isDismiss = false
                }) {
                    Text("변경사항 저장하기")
                        .font(.title3)
                        .bold()
                }
                .tint(.blue)
                .buttonStyle(.bordered)
                
                Spacer()
            }
        }
        .padding()
    }
}

//
//  CreateWalletView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/13.
//

import Foundation
import SwiftUI

struct CreateWalletView: View {
    @EnvironmentObject var viewModel: CreateWalletViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "lock")
                    TextField("두번째 지갑 주소를 입력해주세요.", text: $viewModel.firstWalletAddress)
                }
                .padding()
                
                HStack {
                    Image(systemName: "lock.open")
                    TextField("두번째 지갑 주소를 입력해주세요.", text: $viewModel.secondWalletAddress)
                }
                .padding()
                
                HStack {
                    Image(systemName: "lock.open")
                    TextField("세번째 지갑 주소를 입력해주세요.", text: $viewModel.thirdWalletAddress)
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    viewModel.tapButtonSubject.send()
                }) {
                    HStack {
                        Spacer()
                        Text("눌러서 저장하기")
                        Spacer()
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("지갑 주소 입력")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

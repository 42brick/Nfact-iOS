//
//  EditWalletView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/26.
//

import SwiftUI

struct EditWalletView: View {
    @EnvironmentObject var viewModel: EditWalletViewModel
    
    var body: some View {
        VStack {
            TextField("지갑의 이름", text: $viewModel.name)
            
            TextField("주소", text: $viewModel.adress)
            
            TextField("", text: $viewModel.chain)
        }
        .padding()
    }
}

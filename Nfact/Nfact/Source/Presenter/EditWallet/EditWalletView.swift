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
            TextField("Enter your name", text: $viewModel.name)
            
            TextField("Enter your name", text: $viewModel.adress)
            
            TextField("Enter your name", text: $viewModel.chain)
        }
    }
}

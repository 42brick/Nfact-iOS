//
//  FactoryDetail.swift
//  Nfact
//
//  Created by 송영모 on 2022/10/15.
//

import SwiftUI

struct FactoryDetailView: View {
    
    @State var progress: Double = 0.0
    
    let total: Double = 3.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack {
                if progress < total {
                    ProgressView("")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
            .onReceive(timer) { _ in
                if progress < total {
                    progress += 0.1
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()

                Button(action: {
                    
                }) {
                    Text("갤러리에 저장하기")
                        .font(.title3)
                        .bold()
                }
                .tint(.blue)
                .buttonStyle(.bordered)

                Spacer()
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}


//
//  FactoryView.swift
//  Nfact
//
//  Created by 송영모 on 2022/10/15.
//

import SwiftUI

struct FactoryView: View {
    @Binding var imageData: Data
    @State var scale = 0.0
    @State var seed: String = ""
    @State var toggle = false
    @State var isClick = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Image(uiImage: .init(data: imageData)!)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Spacer()
            }

            VStack(alignment: .leading) {
                Text("CFG Scale")
                    .font(.subheadline)
                
                HStack {
                    Slider(value: $scale, in: 1...15, step: 0.5)
                    
                    Text(String(scale))
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Seed")
                    .font(.subheadline)
                
                HStack {
                    TextField("시드", text: $seed)
                        .padding(.vertical)
   
                    Toggle("", isOn: $toggle)
                }
            }
            .padding()
            
            Spacer()
            
            HStack {
                Spacer()

                Button(action: {
                    isClick = true
                }) {
                    Text("생성하기")
                        .font(.title3)
                        .bold()
                }
                .tint(.blue)
                .buttonStyle(.bordered)

                Spacer()
            }
            
            NavigationLink(destination: FactoryDetailView(), isActive: $isClick) {
            }.hidden()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

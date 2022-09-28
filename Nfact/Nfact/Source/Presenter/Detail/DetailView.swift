//
//  DetailView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/27.
//

import SwiftUI

struct DetailView: View {
    let dummy = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("name")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("XXXXX")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Text("토큰 주소 복사")
                                .font(.subheadline)
                        }
                        .buttonStyle(.bordered)
                        .tint(.green)
                    }
                    .frame(height: 100)
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(dummy,id: \.self) { user in
                            InfoItemView()
                                .frame(width: 60)
                            
                            Divider()
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("상세 정보")
                        .font(.title3)
                        .bold()
                    
                    Text("세부 내용입니다. 어쩌구 저쩌구")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//
//  DetailView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/27.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
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
                    
                    HStack {
                        Text("XXXXX")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Image(systemName: "doc.on.doc")
                                .imageScale(.small)
                        }
                        .buttonStyle(.plain)
                        .tint(.blue)
                    }
                    
                    Spacer()
                }
                .frame(height: 100)
                
                Spacer()
            }
            
            Divider()
                .padding(.vertical)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }
}

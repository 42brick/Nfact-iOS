//
//  InfoItemView.swift
//  Nfact
//
//  Created by 송영모 on 2022/09/28.
//

import SwiftUI

struct InfoItemView: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("소유자")
                .font(.caption2)
                .bold()
                .foregroundColor(.gray)
            
            Image(systemName: "paperplane.circle.fill")
                .imageScale(.large)
            
            Text("xxxxxx")
                .lineLimit(1)
                .font(.caption)
                .foregroundColor(.gray)
                
        }
    }
}

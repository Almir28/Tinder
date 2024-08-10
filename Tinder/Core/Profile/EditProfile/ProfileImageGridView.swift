//
//  ProfileImageGridView.swift
//  Tinder
//
//  Created by Almir Khialov on 07.08.2024.


import SwiftUI

struct ProfileImageGridView: View {
    
    let user: User
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<6, id: \.self) { index in
                if index < user.profileImageURL.count {
                    Image(user.profileImageURL[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: imageWidth, height: imageHeight)
                    
//                    Image(systemName: "plus.circle.fill")
//                        .imageScale(.large)
//                        .foregroundStyle(Color(.secondaryPink))
//                        .offset(x: 4, y: 4)
                    }
                }
            }
        }
    }
}

private extension ProfileImageGridView {
    var columns: [GridItem] {
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible())
        ]
    }
    var imageWidth: CGFloat {
        return 110
    }
    var imageHeight: CGFloat {
        return 160
    }
}

#Preview {
    ProfileImageGridView(user: MockData.users[2])
}

//
//  CurrentUserProfileHeaderView.swift
//  Tinder
//
//  Created by Almir Khialov on 06.08.2024.
//

import SwiftUI

struct CurrentUserProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack {
            ZStack {
                Image(user.profileImageURL[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .background {
                        Circle()
                            .fill(Color(.systemGray6))
                            .frame(width: 128, height: 128)
                            .shadow(radius: 10)
                    }
                
                Image(systemName: "pencil")
                    .imageScale(.small)
                    .foregroundStyle(.gray)
                    .background{
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .offset(x: 49, y: -49)
            }
            Text("\(user.fullname), \(user.age)")
                .font(.title2)
                .fontWeight(.light)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)
    }
}

#Preview {
    CurrentUserProfileHeaderView(user: MockData.users[0])
}

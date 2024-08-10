//
//  CurrentUserProfile.swift
//  Tinder
//
//  Created by Almir Khialov on 06.08.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfile = false
    
    
    
    let user: User
    
    var body: some View {
        NavigationStack {
            List{
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                
                Section("Account Information"){
                    HStack{
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    HStack{
                        Text("Email")
                        
                        Spacer()
                        
                        Text("testemail@outlook.com")
                    }
                }
                
                Section("Legal") {
                    Text("Terms of Service")
                }
                Section{
                    Button("Logout"){
                        print("DEBUG: Logout here..")
                    }
                    .foregroundStyle(.red)
                }
                Section {
                    Button("Delete Account") {
                        print("DEBUG: Delete account here..")
                    }
                    .foregroundStyle(.red)

                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile){
                EditProfileView( user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[2])
}

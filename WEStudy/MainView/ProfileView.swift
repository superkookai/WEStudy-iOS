//
//  ProfileView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 9/1/2566 BE.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("isLogin") var isLogin: Bool?
    
    var username: String{
        UserDefaults.standard.string(forKey: "username") ?? "No name"
    }
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                Text("Hello")
                    .font(.system(size: 70))
                    .bold()
                    .foregroundColor(.white)
                
                Text(username)
                    .font(.system(size: 80))
                    .bold()
                    .foregroundColor(.white)
                
                Button {
                    isLogin = false
                } label: {
                    Text("SignOut")
                }
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

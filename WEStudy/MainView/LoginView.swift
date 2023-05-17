//
//  LoginView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 9/1/2566 BE.
//

import SwiftUI

struct LoginView: View {
    
    @AppStorage("isLogin") var isLogin: Bool?
    @State private var username: String = ""
    @State private var showAlert: Bool = false
    @State private var showSignUp: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                
                TextField("username", text: $username)
                    .font(.title)
                    
                
                Divider()
                    .frame(height: 1)
                    .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                    .padding(.horizontal)
                    .padding(.bottom, 25)
                
                Button {
                    if username.isEmpty{
                        showAlert = true
                    }else{
                        isLogin = true
                        UserDefaults.standard.set(username, forKey: "username")
                    }
                    
                } label: {
                    Text("OK")
                }
                .alert("Username is empty!", isPresented: $showAlert, actions: {
                    
                })
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                HStack {
                    Text("Do not have an account?")
                        .font(.body)
                    
                    Button(action: {
                        showSignUp = true
                    }) {
                        Text("Sign up")
                            .font(.body)
                            .bold()
                            .foregroundColor(Color.green)
                    }

                }.padding(.top, 20)

            }
            .sheet(isPresented: $showSignUp) {
                CreateAccountView()
            }
            .padding(30)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 20)
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  WEStudyApp.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 23/11/2565 BE.
//

import SwiftUI

@main
struct WEStudyApp: App {
    
    @AppStorage("isLogin") var isLogin: Bool = false
    
    var favoriteViewModel = FavoriteViewModel()
    
    var body: some Scene {
        WindowGroup {
            if isLogin{
                MainView()
                    .environmentObject(favoriteViewModel)
            }else{
                LoginView()
            }
        }
    }
}

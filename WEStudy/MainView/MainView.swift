//
//  MainView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 4/1/2566 BE.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        TabView{
            CourseListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Courses")
                }
            
            FavoriteListView()
                .tabItem {
                    Image(systemName: "hand.thumbsup")
                    Text("Favorite")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(FavoriteViewModel())
    }
}

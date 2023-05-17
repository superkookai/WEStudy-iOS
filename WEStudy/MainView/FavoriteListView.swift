//
//  FavoriteListView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 4/1/2566 BE.
//

import SwiftUI

struct FavoriteListView: View {
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.green
                
                List{
                    ForEach(favoriteViewModel.favCourses, id: \.hashValue) { course in
                        ZStack {
                            
                            CourseRowView(course: course)
                            
                            NavigationLink(
                                destination:
                                    CourseDescriptionView(course: course)
                                ,
                                label: {
                                    EmptyView()
                                })
                            .opacity(0)
                        }
                    }
                    .onDelete { indexSet in
                        favoriteViewModel.favCourses.remove(atOffsets: indexSet)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.green)
                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))

                }
                .listStyle(.plain)
                .navigationTitle("Favorite Courses")
                .toolbarBackground(Color.green, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
            .environmentObject(FavoriteViewModel())
    }
}

//
//  ContentView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 23/11/2565 BE.
//

import SwiftUI

struct CourseListView: View {
    
    @State private var courseDict: [String:[String:String]] = [:]
    @State private var courses: [[String:String]] = []
    
    @State private var isShowAlert: Bool = false
    @State private var isError: Bool = false
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    func loadData() async{
        guard let url = URL(string: "https://westudyservice-default-rtdb.firebaseio.com/data.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            courseDict = jsonObject as! [String:[String:String]]
            for (_, course) in courseDict{
                courses.append(course)
            }
        } catch {
            print("Invalid data")
        }
    }
    
    var body: some View {
        
        NavigationStack {
            List{
                
                CoverImageView(courses: courses)
                    .frame(height: 250)
                    .listRowBackground(Color.green)
                    .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
               
                
                ForEach(courses, id: \.hashValue) { course in
                    ZStack {
                        
                        CourseRowView(course: course)
                            .contextMenu{
                                Button {
                                    self.isShowAlert = true
                                    
                                    if let _ = self.favoriteViewModel.favCourses.firstIndex(of: course){
                                        self.isError = true
                                    }else{
                                        self.isError = false
                                        self.favoriteViewModel.favCourses.append(course)
                                    }
                                    
                                } label: {
                                    HStack{
                                        Text("Favorite")
                                        Image(systemName: "star.fill")
                                    }
                                }
                            }
                            .fullScreenCover(isPresented: $isShowAlert, content: {
                                AlertView(isError: isError)
                            })
                        
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
                .listRowSeparator(.hidden)
                .listRowBackground(Color.green)
                .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            }
            .listStyle(.plain)
            .task {
                await loadData()
            }
            .navigationTitle("Courses")
            .toolbarBackground(Color.green, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
            .environmentObject(FavoriteViewModel())
    }
}

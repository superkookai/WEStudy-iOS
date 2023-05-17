//
//  CoverImageView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 2/1/2566 BE.
//

import SwiftUI

struct CoverImageView: View {
    
    var courses: [[String:String]] = []
    
    var body: some View {
        TabView {
            ForEach(courses, id: \.hashValue) { course in
                AsyncImage(url: URL(string: course["photo"]!)) {
                    phase in
                    
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, idealHeight: 200)
                            .clipped()
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
            }//Loop
        }//Tab
        .tabViewStyle(.page)
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}

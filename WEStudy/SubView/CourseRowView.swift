//
//  CourseListView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 29/11/2565 BE.
//

import SwiftUI

struct CourseRowView: View {
    
    @State var course: [String:String]
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: course["photo"]!)) {
                phase in
                
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipped()
                
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            
            Text(course["title"]!)
                .font(.title)
            
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(
            Color.white
        )
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

//struct CourseListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseListView()
//    }
//}

//"https://firebasestorage.googleapis.com/v0/b/westudyservice.appspot.com/o/html.jpeg?alt=media&token=3e4fe2a6-7d6b-4d96-9e43-c1dec94832ba"

//
//  CourseDescriptionView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 29/11/2565 BE.
//

import SwiftUI

struct CourseDescriptionView: View {
    
    @Environment(\.dismiss) var dismiss
    var course: [String:String]
    @State private var showVideoView: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: course["photo"]!)) {
                    phase in
                    
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, idealHeight: 400)
                            .clipped()
                    
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                
                HStack{
                    Text(course["title"]!)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Button {
                        showVideoView = true
                    } label: {
                        Image(systemName: "play.circle")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $showVideoView) {
                        AVPlayerViewSUI(videoName: course["video"], courseTitle: course["title"])
                            .edgesIgnoringSafeArea(.all)
                    }

                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(course["desc"]!)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
                   
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .background(Color.green)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left.circle")
                        .font(.title)
                        .foregroundColor(.black)
                }

            }
        }
    }
}

//struct CourseDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseDescriptionView()
//    }
//}

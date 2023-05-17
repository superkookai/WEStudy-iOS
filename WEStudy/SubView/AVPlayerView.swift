//
//  AVPlayerView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 29/11/2565 BE.
//

import SwiftUI
import AVKit

struct AVPlayerView: UIViewControllerRepresentable {
    
    @State var videoName: String?
    
    private var player: AVPlayer {
        return AVPlayer(url:  URL(string: videoName!)!)
    }
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.modalPresentationStyle = .fullScreen
        playerController.player = player
        playerController.player?.play()
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }
}

struct AVPlayerViewSUI: View {
    
    @State var videoName: String?
    @State var courseTitle: String?
    @Environment(\.dismiss) var dismiss
    
    private var player: AVPlayer {
        var videoPlayer: AVPlayer?
        
        videoPlayer = AVPlayer(url: URL(string: videoName!)!)
        videoPlayer?.play()
        
        return videoPlayer!
    }
    
    var body: some View {
        VStack{
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .overlay(alignment: .topLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(20)
                }
        }
    }
}

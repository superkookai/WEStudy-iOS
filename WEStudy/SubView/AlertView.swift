//
//  AlertView.swift
//  WEStudy
//
//  Created by Weerawut Chaiyasomboon on 6/1/2566 BE.
//

import SwiftUI

struct AlertView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var isError: Bool
    
    var body: some View {
        
        ZStack {
            BackgroundBlurView()
                .opacity(0)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Image(systemName: isError ? "xmark.circle.fill" : "checkmark.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(isError ? .red : .green)
                
                Text(isError ? "Course aleady existed!" : "Success")
                    .font(.title)
                
                Button("OK", role: .cancel) {
                    dismiss()
                }
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
            }
            .padding(.vertical,20)
            .frame(minWidth: 0, maxWidth: .infinity, idealHeight: 250)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 20)
            .padding(.horizontal,20)

        }
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(isError: false)
    }
}

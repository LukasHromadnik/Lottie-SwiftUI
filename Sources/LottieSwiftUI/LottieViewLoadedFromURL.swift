//
//  SwiftUIView.swift
//  
//
//  Created by Javad on 9/27/23.
//

import SwiftUI
import Lottie

@available(iOS 15.0, *)
struct LottieViewFromURL: View {
    
    var url : URL
    
    @State var animation : LottieAnimation? = nil
    
    var body: some View {
        ZStack{
            if let animation = animation {
                LottieView(animation: animation, play: .constant(true))
            }
        }.task {
            animation = await LottieAnimation.loadedFrom(url: url)
            
        }
    }
}


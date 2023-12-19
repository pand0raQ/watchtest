//
//  ContentView.swift
//  watchtest Watch App
//
//  Created by Анастасия Степаносова on 17.07.2023.
//

// while rotating - play sound


import Foundation
import AVKit
import WatchKit
import SwiftUI


struct ContentView: View {
    // not in interface
    @State var scrollAmount = 0.0
    @State var currentState = 0.0
    @State  var isIdle = false
    @State var backgroundGradientone = LinearGradient(
        colors: [Color.red, Color.blue],
        startPoint: .top, endPoint: .bottom)
    @State var backgroundGradienttwo = LinearGradient(
        colors: [Color.green, Color.blue],
        startPoint: .top, endPoint: .bottom)
    @State var backgroundImageOpen = Image("imgopn")
    @State var backgroundImageClosed = Image("imgcl")

    
    
    
    
    
    @State var bgswithed: Bool = false
    
    
    var body: some View {
        
        
        // button part
        TabView{
            ZStack{
                if bgswithed == false {
                    backgroundImageClosed
                    
                        .resizable()
                        .scaledToFit()
                } else {
                    backgroundImageOpen
                        .resizable()
                        .scaledToFit()
                }
    
                
                VStack{
                   
                    Text("Value:\(scrollAmount, specifier: "%.1f")")
                        .padding(55)
                        .fontWeight(.regular)
                        .frame(width: 200)
                        .focusable()
                        .digitalCrownRotation($scrollAmount, from: 0, through: 9999, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true, onChange: { DigitalCrownEvent in
                            playPause()
                            print("played on rotation")
                        }, onIdle: {
                            player.pause()
                            print("paused on iddle")
                            
                        })
                    
                    
                    Button("open") {
                        
                        configureAudioSession()
                        bgswithed.toggle()
    
                            
                    }
                    .padding(65)
                
                    .controlSize(.mini)
                    
                    
                    
                }
            
                

               
            }
            
        
            
        
            VStack{
                
                
                Text("dcs")
                
                Button("initializer") {
                    configureAudioSession()
                    
                    
                }
                
                Text("Received Value:\(scrollAmount, specifier: "%.1f")")
                    .focusable()
                    .digitalCrownRotation($scrollAmount, from: 0, through: 9999, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true, onChange: { DigitalCrownEvent in
                        playPause()
                        print("played on rotation")
                    }, onIdle: {
                        player.pause()
                        print("paused on iddle")
                        
                    })

                    
            }
          
            
            ZStack{
                if bgswithed == false {
                    backgroundGradientone
                } else {
                    backgroundGradienttwo
                }
                Button("changebackground") {
                    bgswithed.toggle()
                    
                }
                
                
            }
           
            .tabViewStyle(.automatic)
            
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


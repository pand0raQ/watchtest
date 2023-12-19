//
//  playerStorage.swift
//  watchtest Watch App
//
//  Created by Анастасия Степаносова on 17.07.2023.
//

import Foundation
import AVKit
import WatchKit
import AVFoundation


var PlayingStatus = false
var player : AVAudioPlayer!

func configureAudioSession() {
    // Retrieve the shared audio session.
    let audioSession = AVAudioSession.sharedInstance()
    do {
        // Set the audio session category and mode.
        try audioSession.setCategory(.playback, mode: .default)
      try   audioSession.setActive(true)
        let url = Bundle.main.url(forResource: "fulll", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.prepareToPlay()
        print ("Session created")
    } catch {
        print("Failed to set the audio session configuration")
    }
}

 func playPause () {
     
     if player.isPlaying{
         print ("is playing")
     } else {
         player.play()
     }
         
         }
     
     
    
    


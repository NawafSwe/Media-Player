//
//  PlaySoundManager.swift
//  mediaPlayer
//
//  Created by Nawaf B Al sharqi on 02/01/2021.
//

import Foundation
import AVFoundation
import AVKit
import UIKit
import SwiftUI
// using singleton approach

final class PlaySoundManager : ObservableObject{
    var player:AVPlayer?
    @Published var isPlaying = false
    func playSound(){
        if !isPlaying{
            DispatchQueue.main.async {
                self.isPlaying = true
            }
            do{
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
               
                // sensitive url
                let playerItem = AVPlayerItem(url: URL(string: "")!)
                 player = AVPlayer(playerItem: playerItem)
                 player?.play()
            }
            catch{
                print(error.localizedDescription)
                print("sound not working")
            }
        }else {
            DispatchQueue.main.async {
                self.isPlaying = false
            }
            player?.pause()
        }
        
    }
}

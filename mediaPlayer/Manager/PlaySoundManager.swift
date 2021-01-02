//
//  PlaySoundManager.swift
//  mediaPlayer
//
//  Created by Nawaf B Al sharqi on 02/01/2021.
//

import Foundation
import AVFoundation
import UIKit
import SwiftUI
// using singleton approach

final class PlaySoundManager : ObservableObject{
    var bombSoundEffect: AVAudioPlayer?
    @Published var isPlaying = false
    func playSound(){
        if !isPlaying{
            DispatchQueue.main.async {
                self.isPlaying = true
            }
            
            guard let path = Bundle.main.path(forResource: "A",ofType : "wav") else {
                print("cannot play sound because there is no such voice")
                return }
            let url = URL(fileURLWithPath: path)
            
            do{
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                bombSoundEffect = try AVAudioPlayer(contentsOf: url,fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = bombSoundEffect else {
                    print("Could not play")
                    return
                }
                player.play()
            }
            catch{
                print("sound not working")
            }
        }else {
            DispatchQueue.main.async {
                self.isPlaying = false
            }
            bombSoundEffect?.pause()
        }
        
    }
    
}

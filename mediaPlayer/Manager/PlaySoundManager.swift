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
           
            let path = Bundle.main.path(forResource: "example.mp3", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do{
                bombSoundEffect = try AVAudioPlayer(contentsOf: url)
                bombSoundEffect?.play()
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

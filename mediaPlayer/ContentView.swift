//
//  ContentView.swift
//  mediaPlayer
//
//  Created by Nawaf B Al sharqi on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = PlaySoundManager()
    var body: some View {
        Button(action:{
            manager.playSound()
        }){
            Text("Start playing some sounds")
        }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  mediaPlayer
//
//  Created by Nawaf B Al sharqi on 02/01/2021.
//

import SwiftUI
import WebKit
struct ContentView: View {
    @ObservedObject var manager = PlaySoundManager()
    var body: some View {
        VStack {
            CardView()
            Button(action:{}){
                Text("Start playing some sounds")
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }
    
    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<WebView>) {
        let request = URLRequest(url: URL(string: "https://www.youtube.com/watch?v=h4kP7H6YlZE")!)
        view.load(request)
        
        
    }
}

struct CardView: View {
    var body: some View{
        VStack {
            WebView()
            
        }
    }
}



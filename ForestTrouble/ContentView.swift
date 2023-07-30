//
//  ContentView.swift
//  ForestTrouble
//
//  Created by Lucas Flores on 26/07/23.
//

import SwiftUI
import UIKit
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = PageScene()
        scene.size = CGSize(width: 852, height: 393)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .ignoresSafeArea()
            SpriteView(scene: scene)
                .frame(width: 852, height: 393)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

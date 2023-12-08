//
//  CardGameApp.swift
//  CardGame
//
//  Created by Diego Santamaria on 6/12/23.
//

import SwiftUI

@main
struct CardGameApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}

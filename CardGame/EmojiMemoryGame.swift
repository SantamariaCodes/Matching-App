//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Diego Santamaria on 6/12/23.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["👻", "🫥", "😈", "👺", "👾", "🤠", "🤖", "👽", "🕷️", "🧙", "🐱", "💀"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame( numberOfPairsOfCards: 8) { pairIndex  in
            if emojis.indices.contains(pairIndex) {
                
                return emojis[pairIndex]

            } else {
                return "⁇"
            }
            
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        
        return model.cards
    }
    
    //MARK: - Intents
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        return model.choose(card)
    }
    
}

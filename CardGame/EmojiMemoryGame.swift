//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Diego Santamaria on 6/12/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    private var currentTheme: Theme

    
    var currentThemeColor : Color {
        currentTheme.color
    }
    
    var currentThemeName : String {
        currentTheme.name
    }
    
    
    
    init() {
        currentTheme = themes.randomElement() ?? themes[0]
        model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }

    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "⁇"
            }
        }
    }

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

    func switchTheme() {
        currentTheme = themes.randomElement() ?? themes[0]
        model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
    
    

}

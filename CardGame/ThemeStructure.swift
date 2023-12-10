//
//  ThemeStructure.swift
//  CardGame
//
//  Created by Diego Santamaria on 10/12/23.
//

import SwiftUI
import Foundation


struct Theme {
    let name: String
    let emojis: [String]
    let color: Color
    let numberOfPairsOfCards: Int
}


let themes: [Theme] = [
    Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷️", "🧙‍♀️", "🦇", "🍬"], color: .orange, numberOfPairsOfCards: 6),
    Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻"], color: .green, numberOfPairsOfCards: 6),
    Theme(name: "Space", emojis: ["🌍", "🚀", "👽", "🛸", "🌌", "🌠"], color: .blue, numberOfPairsOfCards: 6),
    Theme(name: "Sports", emojis: ["⚽", "🏀", "🏈", "⚾", "🎾", "🏐"], color: .red, numberOfPairsOfCards: 6),
    Theme(name: "Fruits", emojis: ["🍎", "🍌", "🍇", "🍉", "🍓", "🍒"], color: .yellow, numberOfPairsOfCards: 6),
    Theme(name: "Travel", emojis: ["✈️", "🗺️", "🏖️", "🚄", "🏔️", "🗽"], color: .purple, numberOfPairsOfCards: 6)
]


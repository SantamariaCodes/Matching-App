//
//  MemoryGame.swift
//  CardGame
//
//  Created by Diego Santamaria on 6/12/23.
//
import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOFTheOneAndOnlyFaceUpCard : Int? {
        get {
            var faceUpCardIndicies = [Int]()
            
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndicies.append(index)
                }
            }
            
            if faceUpCardIndicies.count == 1 {
                return faceUpCardIndicies.first
            } else {
                return nil
            }
        } set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                
                if let potentialMatchIndex = indexOFTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
               
                    indexOFTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
        
    }
    
    
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {
        
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var id: String
        
        var debugDescription: String {
            return " \(id) : \(content) \(isFaceUp ? "up" : "down") \(isMatched  ? "matched" : "")"
        }
        
        
    }
}

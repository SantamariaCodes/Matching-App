import SwiftUI

struct EmojiMemoryGameView: View {
    
   @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Theme: \(viewModel.currentThemeName)") // Display the current theme's name
                .font(.headline)
                .padding()

            ScrollView {
                cards
                .animation(.default, value: viewModel.cards)
            }

            HStack {
                Button("Shuffle Cards") {
                    viewModel.shuffle()
                }
                Button("Switch Theme") {
                    viewModel.switchTheme()
                }
            }.padding()
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                VStack(spacing: 0) {
                    CardView(card, color: viewModel.currentThemeColor) // Pass the theme color to CardView
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    let color: Color  // Accept the color as a parameter

    init(_ card: MemoryGame<String>.Card, color: Color) {
        self.card = card
        self.color = color
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill(color)
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

// Preview
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

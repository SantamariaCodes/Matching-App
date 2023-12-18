import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    // The Pie shape representing a timer or progress indicator
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(240), clockwise: true)
                        .padding(Constants.inset).opacity(Constants.opacity)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    // The content of the card
                    Text(card.content)
                        .font(Font.system(size: Constants.FontSize.largest))
                        .minimumScaleFactor(Constants.FontSize.smallest / Constants.FontSize.largest)
                        .multilineTextAlignment(.center)
                        .aspectRatio(1, contentMode: .fit)
                        .padding(Constants.inset)
                } else {
                    // If the card is not face up, it's just a filled rounded rectangle
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                }
            }
            // Apply the Cardify modifier
            .cardify(isFaceUp: card.isFaceUp)
            // Apply opacity based on whether the card is matched or not
            .opacity(card.isMatched ? 0 : 1)
        }
    }
    
    // Constants used within the CardView
    private struct Constants {
        static let cornerRadius: CGFloat = 10.0
        static let inset: CGFloat = 5.0
        static let opacity: Double = 0.4
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
        }
    }
}


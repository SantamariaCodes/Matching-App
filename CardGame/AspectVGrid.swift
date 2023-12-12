import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat = 1
    @ViewBuilder  var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: items.count,
                size: geometry.size,
                atAspectRatio: aspectRatio
            )
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)],
                      spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    private func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        let minWidth: CGFloat = 65 // Adjust this value as needed
        let maxWidth: CGFloat = max(minWidth, size.width / 2) // Prevents overly large cards
        var bestWidth = minWidth
        
        var columnCount = 1.0
        while columnCount <= CGFloat(count) {
            let itemWidth = size.width / columnCount
            let itemHeight = itemWidth / aspectRatio
            let rowCount = (CGFloat(count) / columnCount).rounded(.up)
            
            if rowCount * itemHeight <= size.height && itemWidth >= minWidth && itemWidth <= maxWidth {
                bestWidth = itemWidth
            }
            
            columnCount += 1
        }
        
        return bestWidth.rounded(.down)
    }
}

//
//  Card.swift
//  VersaUI
//
//  Created by Muhammad Dzaky on 19/10/24.
//

import SwiftUI

public struct VerticalCard<Content: View>: View {
    let content: () -> Content
    
    // Card layout control
    let alignment: HorizontalAlignment
    let spacing: CGFloat
    let padding: CGFloat
    let cornerRadius: CGFloat
    
    @State private var isTapped: Bool = false
    
    public init(
        alignment: HorizontalAlignment = .leading,
        spacing: CGFloat = 8,
        padding: CGFloat = 12,
        cornerRadius: CGFloat = 10,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.content = content
    }
    
    public var body: some View {
        
        VStack(alignment: alignment, spacing: spacing) {
            content()
        }
        .padding(padding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(VersaColor.Neutral.Background.primary)
        )
        .shadow(isTapped ? .flat : .raised)
        .onTapGesture {
            withAnimation(.bouncy(duration:0.2)) {
                // Trigger the symbol effect on button tap
                isTapped = true
                
                // Reset the effect state after a delay to allow re-triggering
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isTapped = false
                }
            }
        }
    }
}

//
//  Card.swift
//  VersaUI
//
//  Created by Muhammad Dzaky on 19/10/24.
//

import SwiftUI

@available(macOS 14.0, *)

public struct VerticalCard<Content: View>: View {
    let content: () -> Content
    
    // Card layout control
    let alignment: HorizontalAlignment
    let spacing: CGFloat
    let padding: CGFloat
    let cornerRadius: CGFloat
    
    @State private var isTapped: Bool = false
    
    // Access the current color scheme (light or dark mode)
    @Environment(\.colorScheme) var colorScheme
    
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
        .scaleEffect(isTapped ? 0.97 : 1.0) // Slightly scale the card when tapped
        .onTapGesture {
            withAnimation {
                // Trigger the symbol effect on button tap
                isTapped = true
                
                // Reset the effect state after a delay to allow re-triggering
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isTapped = false
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(getBackgroundColor())
                .stroke(VersaColor.Neutral.Border.subtle.opacity(0.4), lineWidth: 1)
        )
        .shadow(getShadowStyle())
        .animation(.spring(), value: isTapped)
    }
    
    // Helper function to determine the background color based on the color scheme
    private func getBackgroundColor() -> Color {
        if colorScheme == .dark {
            return VersaColor.Brand.Background.primary // Custom color for dark mode
        } else {
            return VersaColor.Neutral.Background.primary // Custom color for light mode
        }
    }
    
    // Helper function to determine the shadow style based on the color scheme and tap state
    private func getShadowStyle() -> VersaShadowStyle {
        if isTapped || colorScheme == .dark {
            return .flat // Flat shadow when tapped or in dark mode
        } else {
            return .raised // Raised shadow in light mode and when not tapped
        }
    }
}

public struct HorizontalCard<Content: View>: View {
    let content: () -> Content
    
    // Card layout control
    let alignment: VerticalAlignment
    let spacing: CGFloat
    let padding: CGFloat
    let cornerRadius: CGFloat
    
    @State private var isTapped: Bool = false
    
    // Access the current color scheme (light or dark mode)
    @Environment(\.colorScheme) var colorScheme
    
    public init(
        alignment: VerticalAlignment = .top,
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
        
        HStack(alignment: alignment, spacing: spacing) {
            content()
        }
        .padding(padding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scaleEffect(isTapped ? 0.97 : 1.0) // Slightly scale the card when tapped
        .onTapGesture {
            withAnimation {
                // Trigger the symbol effect on button tap
                isTapped = true
                
                // Reset the effect state after a delay to allow re-triggering
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isTapped = false
                }
            }
        }
        clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(getBackgroundColor())
                .stroke(VersaColor.Neutral.Border.subtle.opacity(0.4), lineWidth: 1)
        )
        .shadow(getShadowStyle())
        .animation(.spring(), value: isTapped)
    }
    
    // Helper function to determine the background color based on the color scheme
    private func getBackgroundColor() -> Color {
        if colorScheme == .dark {
            return VersaColor.Brand.Background.primary // Custom color for dark mode
        } else {
            return VersaColor.Neutral.Background.primary // Custom color for light mode
        }
    }
    
    // Helper function to determine the shadow style based on the color scheme and tap state
    private func getShadowStyle() -> VersaShadowStyle {
        if isTapped || colorScheme == .dark {
            return .flat // Flat shadow when tapped or in dark mode
        } else {
            return .raised // Raised shadow in light mode and when not tapped
        }
    }
}


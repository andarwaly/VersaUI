//
//  Shadow.swift
//  VersaUI
//
//  Created by Muhammad Dzaky on 19/10/24.
//

import SwiftUI

struct VersaShadow {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat

    // A method to apply the shadow using SwiftUI's shadow modifier
    func apply(to view: some View) -> some View {
        view.shadow(color: color, radius: radius, x: x, y: y)
    }
}

// Defines the different shadow tokens (like .xl) as a collection of ShadowToken objects.
enum VersaShadowStyle {
    case flat
    case raised
    case floated
    case lifted

    var tokens: [VersaShadow] {
        switch self {
        case .flat:
            return []
        case .raised:
            return [
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.08), radius: 3, x: 0, y: 3),
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.06), radius: 6, x: 0, y: 4),
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.04), radius: 8, x: 0, y: 5)
            ]
        case .floated:
            return [
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.12), radius: 10, x: 0, y: 8),
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.10), radius: 14, x: 0, y: 10),
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.08), radius: 18, x: 0, y: 12)
            ]
        case .lifted:
            return [
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.15), radius: 20, x: 0, y: 16),
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.12), radius: 24, x: 0, y: 18),
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.10), radius: 28, x: 0, y: 20),
                VersaShadow(color: VersaColor.Neutral.Effect.primary.opacity(0.08), radius: 32, x: 0, y: 22)
            ]
        }
    }
}

// Applies the shadow tokens in sequence to create the compound shadow effect.
struct VersaShadowModifier: ViewModifier {
    let style: VersaShadowStyle

    func body(content: Content) -> some View {
        var modifiedContent = content
        for token in style.tokens {
            modifiedContent = token.apply(to: modifiedContent) as! VersaShadowModifier.Content
        }
        return modifiedContent
    }
}

// Makes it easy to apply the shadow using a single method.
extension View {
    func shadow(_ style: VersaShadowStyle) -> some View {
        self.modifier(VersaShadowModifier(style: style))
    }
}

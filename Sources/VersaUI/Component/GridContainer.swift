//
//  GridContainer.swift
//  VersaUI
//
//  Created by Muhammad Dzaky on 19/10/24.
//

import SwiftUI

@available(macOS 11.0, *)
public struct VGridContainer<Content: View>: View {
    public let content: Content
    
    let columns: [GridItem]
    let spacing: CGFloat
    
    public init(
        columns: [GridItem],
        spacing: CGFloat = 8,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.columns = columns
        self.spacing = spacing
    }
    
    public var body: some View {
        LazyVGrid(columns: columns, spacing: spacing) {
            content
        }
    }
}

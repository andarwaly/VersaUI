//
//  Typography.swift
//  VersaUI
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import CoreText
import Foundation
import SwiftUI

public struct VersaType {
    public var font: Font
    public var weight: Font.Weight
    public var size: Font.TextStyle
}

// MARK: Collection of TextStyle
enum TextStyle {
    enum Heading {
        case h1, h2, h3, h4
    }
    
    enum Paragraph {
        enum p1 {
            case light, heavy
        }
        enum p2 {
            case light, heavy
        }
    }
    enum Label {
        enum l2 {
            case light, heavy
        }
        enum l3 {
            case light, heavy
        }
    }
}


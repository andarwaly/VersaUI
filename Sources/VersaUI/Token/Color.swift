//
//  Color.swift
//  VersaUI
//
//  Created by Muhammad Dzaky on 17/10/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)

public struct VersaColor {
    
    public struct Neutral {
        
        public struct Background {
            public static let primary = Color("Neutral/1", bundle: .module)
            public static let secondary = Color("Neutral/2", bundle: .module)
        }
        
        public struct Interactive {
            public static let rest = Color("Neutral/3", bundle: .module)
            public static let focussed = Color("Neutral/4", bundle: .module)
            public static let pressed = Color("Neutral/5", bundle: .module)
        }
        
        public struct Border {
            public static let subtle = Color("Neutral/6", bundle: .module)
            public static let rest = Color("Neutral/7", bundle: .module)
            public static let focussed = Color("Neutral/8", bundle: .module)
        }
        
        public struct Highlights {
            public static let rest = Color("Neutral/9", bundle: .module)
            public static let focussed = Color("Neutral/10", bundle: .module)
        }
        
        public struct Text {
            public static let primary = Color("Neutral/12", bundle: .module)
            public static let secondary = Color("Neutral/11", bundle: .module)
        }
        
    }
    
    public struct Brand {
        
        public struct Background {
            public static let primary = Color("Brand/1", bundle: .module)
            public static let secondary = Color("Brand/2", bundle: .module)
        }
        
        public struct Interactive {
            public static let rest = Color("Brand/3", bundle: .module)
            public static let focussed = Color("Brand/4", bundle: .module)
            public static let pressed = Color("Brand/5", bundle: .module)
        }
        
        public struct Border {
            public static let subtle = Color("Brand/6", bundle: .module)
            public static let rest = Color("Brand/7", bundle: .module)
            public static let focussed = Color("Brand/8", bundle: .module)
        }
        
        public struct Highlights {
            public static let rest = Color("Brand/9", bundle: .module)
            public static let focussed = Color("Brand/10", bundle: .module)
        }
        
        public struct Text {
            public static let primary = Color("Brand/12", bundle: .module)
            public static let secondary = Color("Brand/11", bundle: .module)
        }
        
    }
}


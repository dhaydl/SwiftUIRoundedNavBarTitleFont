//
//  NavigationTitleColor.swift
//
//
//  Created by David Haydl on 22.01.24.
//

import SwiftUI

#if os(iOS)
/// alias for UIColor/NSColor depending on user's OS
typealias NativeColor = UIColor
#else
/// alias for UIColor/NSColor depending on user's OS
typealias NativeColor = NSColor
#endif

/// enum for using NSColor/UIColor or SwiftUI's color without any conditionals
enum NavigationTitleColor {
    /// case for SwiftUI color
    case color(Color)
    
    /// case for UIColor/NSColor
    case nativeColor(NativeColor)
    
    /// - Returns: a UIColor/NSColor, depending on the user's OS, regarding whether SwiftUI color or UIColor/NSColor was provided
    func getNativeColor() -> NativeColor {
        switch self {
        case .color(let color):
            return NativeColor(color)
        case .nativeColor(let nativeColor):
            return nativeColor
        }
    }
}

//
//  NavigationTitleConfiguration.swift
//
//
//  Created by David Haydl on 22.01.24.
//

import Foundation

/// object for configuring a navigation title
///
/// when not provided with `roundedNavigationTitle`, it uses a default configuration
public struct NavigationTitleConfiguration {
    /// the default configuration of a navigation title
    public static var `default` = NavigationTitleConfiguration(foregroundColor: nil)
    
    /// the foreground color of the navigation title, or, in other words, the color of the displayed text
    ///
    /// defaults to either black and white, depending on the light/dark mode setting of the user's device
    var foregroundColor: NavigationTitleColor?
    
    public init(foregroundColor: NavigationTitleColor?) {
        self.foregroundColor = foregroundColor
    }
}

/// extension for Equatable conformance
extension NavigationTitleConfiguration: Equatable {
    public static func == (lhs: NavigationTitleConfiguration, rhs: NavigationTitleConfiguration) -> Bool {
        return lhs.foregroundColor == rhs.foregroundColor
    }
}

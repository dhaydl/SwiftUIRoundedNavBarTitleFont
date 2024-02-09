//
//  RoundedNavigationTitleViewModifier.swift
//
//
//  Created by David Haydl on 22.01.24.
//

import SwiftUI

/// view modifier implementation for showing a navigation title with a rounded font
///
/// should be used with the `roundedNavigationTitle` function of the `View` extension this package offers
public struct RoundedNavigationTitleViewModifier: ViewModifier {
    @Environment(\.globalNavigationTitleConfiguration) var globalNavigationTitleConfiguration
    
    /// the navigation title to display
    var title: String
    
    /// an instance of `NavigationTitleConfiguration` that describes how the navigation title should look like, can be optional and will be overruled when a configuration is provided with the `globalNavigationTitleConfiguration` environment key
    var configuration: NavigationTitleConfiguration?
    
    public func body(content: Content) -> some View {
        content
        .navigationTitle(Text(title))
        #if os(iOS)
        .background {
            StyledNavigationTitle(
                configuration: globalNavigationTitleConfiguration != NavigationTitleConfiguration.default ? globalNavigationTitleConfiguration : configuration
            )
        }
        #endif
    }
}

public extension View {
    /// view modifier function for showing a navigation title with a rounded font
    ///
    /// - Parameters:
    ///     - title: the navigation title to display
    ///     - configuration: an instance of `NavigationTitleConfiguration` that describes how the navigation title should look like, can be optional and will be overruled when a configuration is provided with the `globalNavigationTitleConfiguration` environment key
    ///
    /// - Returns: the modified view
    func roundedNavigationTitle(_ title: String, configuration: NavigationTitleConfiguration? = nil) -> some View {
        return self.modifier(
            RoundedNavigationTitleViewModifier(title: title, configuration: configuration)
        )
    }
}

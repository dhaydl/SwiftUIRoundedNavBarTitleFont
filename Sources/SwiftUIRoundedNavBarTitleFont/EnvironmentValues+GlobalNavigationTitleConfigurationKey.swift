//
//  EnvironmentValues+GlobalNavigationTitleConfigurationKey.swift
//
//
//  Created by David Haydl on 09.02.24.
//

import SwiftUI

struct GlobalNavigationTitleConfigurationKey: EnvironmentKey {
    static var defaultValue = NavigationTitleConfiguration.default
}

/// extension for the environment key for providing a navigation title configuration globally
public extension EnvironmentValues {
    /// the key for providing a navigation title configuration globally
    var globalNavigationTitleConfiguration: NavigationTitleConfiguration {
        get {
            return self[GlobalNavigationTitleConfigurationKey.self]
        }
        
        set {
            self[GlobalNavigationTitleConfigurationKey.self] = newValue
        }
    }
}

//
//  StyledNavigationTitle.swift
//  
//
//  Created by David Haydl on 22.01.24.
//

import SwiftUI

#if os(iOS)
/// invisible view controller for styling the navigation title
struct StyledNavigationTitle: UIViewControllerRepresentable {
    var configuration: NavigationTitleConfiguration?
    
    @MainActor
    final class StyledNavigationTitleController: UIViewController {
        var configuration: NavigationTitleConfiguration
        
        init(configuration: NavigationTitleConfiguration?) {
            self.configuration = configuration ?? NavigationTitleConfiguration.default
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .clear
            view.isUserInteractionEnabled = false
        }

        override func didMove(toParent parent: UIViewController?) {
            super.didMove(toParent: parent)

            if let navigationController = parent?.navigationController as? UINavigationController {
                var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle)
                titleFont = UIFont(
                    descriptor: titleFont.fontDescriptor.withDesign(.rounded)?.withSymbolicTraits(.traitBold) ?? titleFont.fontDescriptor,
                    size: titleFont.pointSize
                )
                
                var titleAttributes: [NSAttributedString.Key: Any] = [
                    .font: titleFont
                ]
           
                if let foregroundColor = configuration.foregroundColor {
                    titleAttributes[.foregroundColor] = foregroundColor.getNativeColor()
                }
                
                navigationController.navigationBar.standardAppearance.largeTitleTextAttributes = titleAttributes
            }
        }
    }

    func makeUIViewController(context: Context) -> StyledNavigationTitleController {
        return .init(configuration: configuration)
    }

    func updateUIViewController(_ uiViewController: StyledNavigationTitleController, context: Context) {
    }
}
#endif

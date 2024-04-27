//
//  UIApplication+topViewController.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import Foundation
import SwiftUI

extension UIApplication {
    func topViewController() -> UIViewController? {
        var topViewController: UIViewController?
        for scene in connectedScenes {
            if let windowScene = scene as? UIWindowScene {
                for window in windowScene.windows where window.isKeyWindow {
                    topViewController = window.rootViewController
                }
            }
        }
        guard let keyWindow = UIApplication.shared.currentUIWindow() else { return nil }
        if var topViewController = keyWindow.rootViewController {
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }
        } else {
            return nil
        }

        return topViewController
    }
}
public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }

        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }

        return window
    }
}

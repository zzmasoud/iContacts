//
//  SceneDelegate.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        guard let tabbar = scene.windows.first?.rootViewController as? UITabBarController,
              let navbar = tabbar.viewControllers?[1] as? UINavigationController,
              let vc = navbar.topViewController as? ContactsTableViewController
        else { fatalError("flow changed and it's not expected!") }

        let localProvider = LocalContactsProvider(browser: BundleBrowser(), fileName: "contacts")
        vc.viewModel = ContactsTableViewControllerVM(provider: localProvider)
    }

}


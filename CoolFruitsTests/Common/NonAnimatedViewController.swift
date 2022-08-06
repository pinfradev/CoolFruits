//
//  NonAnimatedViewController.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 5/8/22.
//

import UIKit

class NonAnimatableNavigationController: UINavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}

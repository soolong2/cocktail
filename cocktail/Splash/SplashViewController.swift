//
//  splashViewController.swift
//  cocktail
//
//  Created by so on 2022/06/12.
//

import UIKit

class SplashViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut) {
            self.leadingConstraint.constant = -(self.imageView.frame.width - self.view.frame.width)
            self.view.layoutIfNeeded()
        } completion: { _ in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
}


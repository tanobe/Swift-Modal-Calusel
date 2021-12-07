//
//  Utility.swift
//  Test-Modal-calusel
//
//  Created by Kai Tanobe on 2021/11/29.
//

import UIKit

extension UIViewController {
   func presentModal(_ viewControllerToPresent: UIViewController, modalTransitionStyle: UIModalTransitionStyle, completion: (() -> Void)? = nil) {
       let nvc = UINavigationController(rootViewController: viewControllerToPresent)
       nvc.modalPresentationStyle = .overFullScreen
       nvc.isNavigationBarHidden = true
       nvc.modalTransitionStyle = modalTransitionStyle
       present(nvc, animated: true, completion: completion)
   }
}


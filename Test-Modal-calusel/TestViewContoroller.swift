//
//  Test.swift
//  Test-Modal-calusel
//
//  Created by Kai Tanobe on 2021/12/08.
//

import Foundation
import UIKit

class TestViewContoroller: UIViewController {
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        button.setTitle("close", for: UIControl.State.normal)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "modal_Mask")
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(self.closeTapped(_:)), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc private func closeTapped(_ sender: UIButton) {
        closeButton.isHidden = true
        dismiss(animated: true, completion: nil)
    }
}

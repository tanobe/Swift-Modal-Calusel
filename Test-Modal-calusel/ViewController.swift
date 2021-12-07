//
//  ViewController.swift
//  Test-Modal-calusel
//
//  Created by Kai Tanobe on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    private let items: [DataItem] = [
        DataItem(userName: "Apple", color: .red, contents: ["あ", "い", "う", "え"]),
        DataItem(userName: "Bunana", color: .yellow, contents: ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "a", " 1", "c", "d", "e", "f", "g", "h", "i", "j"]),
        DataItem(userName: "orange", color: .orange, contents: ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "a", "3", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"]),
        DataItem(userName: "Grape", color: .purple, contents: ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"]),
        DataItem(userName: "Peach", color: .systemPink, contents: ["a", "b", "c", "d", "e", "f", "g"])
    ]
    
    private let item: DataItem
    
    init(item: DataItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("modal", for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        presentButton.addTarget(self, action: #selector(self.onPresentTapped), for: .touchUpInside)
        
        view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 280).isActive = true
        presentButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        presentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    @objc func onPresentTapped(_ sender: UIButton) {
        let vc = CollectionViewController(items: items)
        self.presentModal(vc, modalTransitionStyle: .crossDissolve)
        print("テスト")
    }
}


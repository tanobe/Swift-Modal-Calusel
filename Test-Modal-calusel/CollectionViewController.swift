//
//  CollectionViewController.swift
//  Test-Modal-calusel
//
//  Created by Kai Tanobe on 2021/11/29.
//

import UIKit

//private let reuseIdentifier = "CustomCell"

class CollectionViewController: UIViewController {
    
    private let dataSource: [DataItem]
    
    private let reuseIdentifier = "CustomCell"
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        button.setTitle("close", for: UIControl.State.normal)
        return button
    }()
    
    @objc private let nextPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        button.setTitle("next", for: UIControl.State.normal)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(items: [DataItem]) {
        self.dataSource = items
        
//        let flowLayout = CarouselCollectionViewFlowLayout()
//      ↑ 52行目にあるので大丈夫。
        super.init(nibName: nil, bundle: nil)
    }
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = CarouselCollectionViewFlowLayout()
        //      ↓ CarouselCollectionViewFlowLayoutで記載したため必要無と思われる。あとで消す。
        //        layout.scrollDirection = .horizontalあとで消す。
        //        layout.minimumInteritemSpacing = 0あとで消す。
        //        layout.minimumLineSpacing = 0あとで消す。
        
        
        //      ↓ CollectionViewのx, yの座標にあたる。
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "modal_Mask")

        view.addSubview(collectionView)
        view.addSubview(closeButton)
        view.addSubview(nextPageButton)
//        let nvc = UINavigationController(rootViewController: self)
//        nvc.isNavigationBarHidden = true
            
        
        closeButton.addTarget(self, action: #selector(self.closeTapped(_:)), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        nextPageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextPageButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nextPageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextPageButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)

//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //コレクションビューで使用するセルをメソッドで登録します。あとで消す。
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    @objc private func closeTapped(_ sender: UIButton) {
        closeButton.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func nextTapped(sender: UIButton) {
        let vc = TestViewContoroller()
        self.navigationController?.pushViewController(vc, animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
}


extension CollectionViewController: UICollectionViewDataSource {
    // コレクションビューに配置するセルの個数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
//    collectionView(_:cellForItemAt:)メソッドでは、セルの設定を行います。あとで消す。
//    dequeueReusableCell(withReuseIdentifier:for:)メソッドでセルオブジェクトを取り出し、セルにモデルオブジェクトを渡して設定を行っています。あとで消す。
//    新しくCustomCellオブジェクトを生成するのではなく、dequeueReusableCell(withReuseIdentifier:for:)メソッドでキューに溜まっているセルオブジェクトを再利用するというところがポイントです。あとで消す。
    
    func collectionView(_ collecprepareForReusetionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        cell.configureCell(with: dataSource[indexPath.item])
        return cell
    }
}


extension CollectionViewController: UICollectionViewDelegate {

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      //ここでは画面の横サイズの半分の大きさのcellサイズを指定  あとで消す。
      return CGSize(width: view.bounds.width - 40, height: view.bounds.height)
  }

}

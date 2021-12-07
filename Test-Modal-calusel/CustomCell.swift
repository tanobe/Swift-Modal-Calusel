//
//  CollectionViewCell.swift
//  Test-Modal-calusel
//
//  Created by Kai Tanobe on 2021/11/30.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    private var item: DataItem!
    
    private let identifier = "cell"
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.sectionFooterHeight = .leastNormalMagnitude
        tableView.sectionHeaderHeight = .leastNormalMagnitude
        tableView.rowHeight = 100
        tableView.clipsToBounds = true
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
//        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self

        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setup() {
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 3.0
        layer.backgroundColor = UIColor.yellow.cgColor

        
    }
    
    func configureCell(with item: DataItem) {
        self.item = item
        tableView.reloadData()
    }
    
}

extension CustomCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.contents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = item.contents[indexPath.row]
        cell.backgroundColor = item.color
        return cell
    }
}
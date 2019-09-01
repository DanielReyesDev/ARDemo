//
//  MenuRootView.swift
//  ARDemo
//
//  Created by Daniel Reyes Sanchez on 9/1/19.
//  Copyright © 2019 Wizeline. All rights reserved.
//

import UIKit

protocol MenuRootViewDelegate: AnyObject {
    func rootView(didSelectRow row: Int)
}

final class MenuRootView: NiblessView {
    
    weak var delegate: MenuRootViewDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(tableView)
        tableView.pinToSuperview()
    }
}

extension MenuRootView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.textLabel?.text = "Demo 1"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.rootView(didSelectRow: indexPath.row)
    }
}

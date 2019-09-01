//
//  MenuRootView.swift
//  ARDemo
//
//  Created by Daniel Reyes Sanchez on 9/1/19.
//  Copyright © 2019 Wizeline. All rights reserved.
//

import UIKit

final class MenuRootView: NiblessView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
    }
}

//
//  MenuViewController.swift
//  ARDemo
//
//  Created by Daniel Reyes Sanchez on 9/1/19.
//  Copyright © 2019 Wizeline. All rights reserved.
//

import UIKit

final class MenuViewController: NiblessViewController {
    
    private let rootView = MenuRootView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

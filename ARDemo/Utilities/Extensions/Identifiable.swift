//
//  Identifiable.swift
//  ARDemo
//
//  Created by Daniel Reyes Sanchez on 9/1/19.
//  Copyright © 2019 Wizeline. All rights reserved.
//

import UIKit

/// Identifiable is in charge of describe it's implementor by returning a `String` when you access to the identifier static variable.
/// It's very useful when working with `UICollectionViewCell`s or `UITableViewCell`s, since they need an `String` identifier
protocol Identifiable {}
extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

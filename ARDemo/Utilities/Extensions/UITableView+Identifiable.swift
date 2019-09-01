//
//  UITableView+Identifiable.swift
//  ARDemo
//
//  Created by Daniel Reyes Sanchez on 9/1/19.
//  Copyright © 2019 Wizeline. All rights reserved.
//

import UIKit

/// Here we simply are making all UITableViewCell's conforming to Identifiable protocol
/// in order to gain access to the String static identifier
extension UITableViewCell: Identifiable {}

extension UITableView {
    
    /**
        Convenience method to register a cell knowing it conforms the Identifiable protocol.
        - Parameter cellClass: UITableViewCell class to register.
     */
    func register(_ cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    /**
        Convenience method to dequeue a cell knowing it conforms the Identifiable protocol.
        With this method we only have the fatalError in one place.
        - Parameter indexPath: IndexPath to dequeue cell.
     */
    func dequeueReusableCell<T: Identifiable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("\(String(describing: T.identifier)) could not be dequeue")
        }
        return cell
    }
}
